// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_households.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
abstract class _$$SearchHouseholdsInitializedEventImplCopyWith<$Res> {
  factory _$$SearchHouseholdsInitializedEventImplCopyWith(
          _$SearchHouseholdsInitializedEventImpl value,
          $Res Function(_$SearchHouseholdsInitializedEventImpl) then) =
      __$$SearchHouseholdsInitializedEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchHouseholdsInitializedEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsInitializedEventImpl>
    implements _$$SearchHouseholdsInitializedEventImplCopyWith<$Res> {
  __$$SearchHouseholdsInitializedEventImplCopyWithImpl(
      _$SearchHouseholdsInitializedEventImpl _value,
      $Res Function(_$SearchHouseholdsInitializedEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchHouseholdsInitializedEventImpl
    implements SearchHouseholdsInitializedEvent {
  const _$SearchHouseholdsInitializedEventImpl();

  @override
  String toString() {
    return 'SearchHouseholdsEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsInitializedEventImpl);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
      _$SearchHouseholdsInitializedEventImpl;
}

/// @nodoc
abstract class _$$SearchHouseholdsByHouseholdsEventImplCopyWith<$Res> {
  factory _$$SearchHouseholdsByHouseholdsEventImplCopyWith(
          _$SearchHouseholdsByHouseholdsEventImpl value,
          $Res Function(_$SearchHouseholdsByHouseholdsEventImpl) then) =
      __$$SearchHouseholdsByHouseholdsEventImplCopyWithImpl<$Res>;
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
class __$$SearchHouseholdsByHouseholdsEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsByHouseholdsEventImpl>
    implements _$$SearchHouseholdsByHouseholdsEventImplCopyWith<$Res> {
  __$$SearchHouseholdsByHouseholdsEventImplCopyWithImpl(
      _$SearchHouseholdsByHouseholdsEventImpl _value,
      $Res Function(_$SearchHouseholdsByHouseholdsEventImpl) _then)
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
    return _then(_$SearchHouseholdsByHouseholdsEventImpl(
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

class _$SearchHouseholdsByHouseholdsEventImpl
    implements SearchHouseholdsByHouseholdsEvent {
  const _$SearchHouseholdsByHouseholdsEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsByHouseholdsEventImpl &&
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
  _$$SearchHouseholdsByHouseholdsEventImplCopyWith<
          _$SearchHouseholdsByHouseholdsEventImpl>
      get copyWith => __$$SearchHouseholdsByHouseholdsEventImplCopyWithImpl<
          _$SearchHouseholdsByHouseholdsEventImpl>(this, _$identity);

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
      _$SearchHouseholdsByHouseholdsEventImpl;

  String get projectId;
  double? get latitude;
  double? get longitude;
  double? get maxRadius;
  bool get isProximityEnabled;
  HouseholdModel get householdModel;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsByHouseholdsEventImplCopyWith<
          _$SearchHouseholdsByHouseholdsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWith<$Res> {
  factory _$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWith(
          _$SearchHouseholdsSearchByHouseholdHeadEventImpl value,
          $Res Function(_$SearchHouseholdsSearchByHouseholdHeadEventImpl)
              then) =
      __$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String searchText,
      String projectId,
      bool isProximityEnabled,
      double? latitude,
      double? longitude,
      double? maxRadius,
      String? tag,
      int offset,
      int limit});
}

/// @nodoc
class __$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsSearchByHouseholdHeadEventImpl>
    implements _$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWith<$Res> {
  __$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWithImpl(
      _$SearchHouseholdsSearchByHouseholdHeadEventImpl _value,
      $Res Function(_$SearchHouseholdsSearchByHouseholdHeadEventImpl) _then)
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
    Object? tag = freezed,
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_$SearchHouseholdsSearchByHouseholdHeadEventImpl(
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
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$SearchHouseholdsSearchByHouseholdHeadEventImpl
    implements SearchHouseholdsSearchByHouseholdHeadEvent {
  const _$SearchHouseholdsSearchByHouseholdHeadEventImpl(
      {required this.searchText,
      required this.projectId,
      required this.isProximityEnabled,
      this.latitude,
      this.longitude,
      this.maxRadius,
      this.tag,
      required this.offset,
      required this.limit});

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
  final String? tag;
  @override
  final int offset;
  @override
  final int limit;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.searchByHouseholdHead(searchText: $searchText, projectId: $projectId, isProximityEnabled: $isProximityEnabled, latitude: $latitude, longitude: $longitude, maxRadius: $maxRadius, tag: $tag, offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsSearchByHouseholdHeadEventImpl &&
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
                other.maxRadius == maxRadius) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, projectId,
      isProximityEnabled, latitude, longitude, maxRadius, tag, offset, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWith<
          _$SearchHouseholdsSearchByHouseholdHeadEventImpl>
      get copyWith =>
          __$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWithImpl<
                  _$SearchHouseholdsSearchByHouseholdHeadEventImpl>(
              this, _$identity);

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
  }) {
    return searchByHouseholdHead(searchText, projectId, isProximityEnabled,
        latitude, longitude, maxRadius, tag, offset, limit);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
  }) {
    return searchByHouseholdHead?.call(searchText, projectId,
        isProximityEnabled, latitude, longitude, maxRadius, tag, offset, limit);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
    required TResult orElse(),
  }) {
    if (searchByHouseholdHead != null) {
      return searchByHouseholdHead(searchText, projectId, isProximityEnabled,
          latitude, longitude, maxRadius, tag, offset, limit);
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
          final double? maxRadius,
          final String? tag,
          required final int offset,
          required final int limit}) =
      _$SearchHouseholdsSearchByHouseholdHeadEventImpl;

  String get searchText;
  String get projectId;
  bool get isProximityEnabled;
  double? get latitude;
  double? get longitude;
  double? get maxRadius;
  String? get tag;
  int get offset;
  int get limit;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsSearchByHouseholdHeadEventImplCopyWith<
          _$SearchHouseholdsSearchByHouseholdHeadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsByProximityEventImplCopyWith<$Res> {
  factory _$$SearchHouseholdsByProximityEventImplCopyWith(
          _$SearchHouseholdsByProximityEventImpl value,
          $Res Function(_$SearchHouseholdsByProximityEventImpl) then) =
      __$$SearchHouseholdsByProximityEventImplCopyWithImpl<$Res>;
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
class __$$SearchHouseholdsByProximityEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsByProximityEventImpl>
    implements _$$SearchHouseholdsByProximityEventImplCopyWith<$Res> {
  __$$SearchHouseholdsByProximityEventImplCopyWithImpl(
      _$SearchHouseholdsByProximityEventImpl _value,
      $Res Function(_$SearchHouseholdsByProximityEventImpl) _then)
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
    return _then(_$SearchHouseholdsByProximityEventImpl(
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

class _$SearchHouseholdsByProximityEventImpl
    implements SearchHouseholdsByProximityEvent {
  const _$SearchHouseholdsByProximityEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsByProximityEventImpl &&
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
  _$$SearchHouseholdsByProximityEventImplCopyWith<
          _$SearchHouseholdsByProximityEventImpl>
      get copyWith => __$$SearchHouseholdsByProximityEventImplCopyWithImpl<
          _$SearchHouseholdsByProximityEventImpl>(this, _$identity);

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
      required final int limit}) = _$SearchHouseholdsByProximityEventImpl;

  double get latitude;
  double get longititude;
  String get projectId;
  double get maxRadius;
  int get offset;
  int get limit;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsByProximityEventImplCopyWith<
          _$SearchHouseholdsByProximityEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsByTagEventImplCopyWith<$Res> {
  factory _$$SearchHouseholdsByTagEventImplCopyWith(
          _$SearchHouseholdsByTagEventImpl value,
          $Res Function(_$SearchHouseholdsByTagEventImpl) then) =
      __$$SearchHouseholdsByTagEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tag, String projectId});
}

/// @nodoc
class __$$SearchHouseholdsByTagEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsByTagEventImpl>
    implements _$$SearchHouseholdsByTagEventImplCopyWith<$Res> {
  __$$SearchHouseholdsByTagEventImplCopyWithImpl(
      _$SearchHouseholdsByTagEventImpl _value,
      $Res Function(_$SearchHouseholdsByTagEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? projectId = null,
  }) {
    return _then(_$SearchHouseholdsByTagEventImpl(
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

class _$SearchHouseholdsByTagEventImpl implements SearchHouseholdsByTagEvent {
  const _$SearchHouseholdsByTagEventImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsByTagEventImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsByTagEventImplCopyWith<_$SearchHouseholdsByTagEventImpl>
      get copyWith => __$$SearchHouseholdsByTagEventImplCopyWithImpl<
          _$SearchHouseholdsByTagEventImpl>(this, _$identity);

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
      required final String projectId}) = _$SearchHouseholdsByTagEventImpl;

  String get tag;
  String get projectId;
  @JsonKey(ignore: true)
  _$$SearchHouseholdsByTagEventImplCopyWith<_$SearchHouseholdsByTagEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchHouseholdsClearEventImplCopyWith<$Res> {
  factory _$$SearchHouseholdsClearEventImplCopyWith(
          _$SearchHouseholdsClearEventImpl value,
          $Res Function(_$SearchHouseholdsClearEventImpl) then) =
      __$$SearchHouseholdsClearEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchHouseholdsClearEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$SearchHouseholdsClearEventImpl>
    implements _$$SearchHouseholdsClearEventImplCopyWith<$Res> {
  __$$SearchHouseholdsClearEventImplCopyWithImpl(
      _$SearchHouseholdsClearEventImpl _value,
      $Res Function(_$SearchHouseholdsClearEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchHouseholdsClearEventImpl implements SearchHouseholdsClearEvent {
  const _$SearchHouseholdsClearEventImpl();

  @override
  String toString() {
    return 'SearchHouseholdsEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsClearEventImpl);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class SearchHouseholdsClearEvent implements SearchHouseholdsEvent {
  const factory SearchHouseholdsClearEvent() = _$SearchHouseholdsClearEventImpl;
}

/// @nodoc
abstract class _$$IndividualGlobalSearchEventImplCopyWith<$Res> {
  factory _$$IndividualGlobalSearchEventImplCopyWith(
          _$IndividualGlobalSearchEventImpl value,
          $Res Function(_$IndividualGlobalSearchEventImpl) then) =
      __$$IndividualGlobalSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalSearchParameters globalSearchParams});
}

/// @nodoc
class __$$IndividualGlobalSearchEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$IndividualGlobalSearchEventImpl>
    implements _$$IndividualGlobalSearchEventImplCopyWith<$Res> {
  __$$IndividualGlobalSearchEventImplCopyWithImpl(
      _$IndividualGlobalSearchEventImpl _value,
      $Res Function(_$IndividualGlobalSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalSearchParams = null,
  }) {
    return _then(_$IndividualGlobalSearchEventImpl(
      globalSearchParams: null == globalSearchParams
          ? _value.globalSearchParams
          : globalSearchParams // ignore: cast_nullable_to_non_nullable
              as GlobalSearchParameters,
    ));
  }
}

/// @nodoc

class _$IndividualGlobalSearchEventImpl implements IndividualGlobalSearchEvent {
  const _$IndividualGlobalSearchEventImpl({required this.globalSearchParams});

  @override
  final GlobalSearchParameters globalSearchParams;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.individualGlobalSearch(globalSearchParams: $globalSearchParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualGlobalSearchEventImpl &&
            (identical(other.globalSearchParams, globalSearchParams) ||
                other.globalSearchParams == globalSearchParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, globalSearchParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndividualGlobalSearchEventImplCopyWith<_$IndividualGlobalSearchEventImpl>
      get copyWith => __$$IndividualGlobalSearchEventImplCopyWithImpl<
          _$IndividualGlobalSearchEventImpl>(this, _$identity);

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
  }) {
    return individualGlobalSearch(globalSearchParams);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
  }) {
    return individualGlobalSearch?.call(globalSearchParams);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
    required TResult orElse(),
  }) {
    if (individualGlobalSearch != null) {
      return individualGlobalSearch(globalSearchParams);
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
  }) {
    return individualGlobalSearch(this);
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
  }) {
    return individualGlobalSearch?.call(this);
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
    required TResult orElse(),
  }) {
    if (individualGlobalSearch != null) {
      return individualGlobalSearch(this);
    }
    return orElse();
  }
}

abstract class IndividualGlobalSearchEvent implements SearchHouseholdsEvent {
  const factory IndividualGlobalSearchEvent(
          {required final GlobalSearchParameters globalSearchParams}) =
      _$IndividualGlobalSearchEventImpl;

  GlobalSearchParameters get globalSearchParams;
  @JsonKey(ignore: true)
  _$$IndividualGlobalSearchEventImplCopyWith<_$IndividualGlobalSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HouseHoldGlobalSearchEventImplCopyWith<$Res> {
  factory _$$HouseHoldGlobalSearchEventImplCopyWith(
          _$HouseHoldGlobalSearchEventImpl value,
          $Res Function(_$HouseHoldGlobalSearchEventImpl) then) =
      __$$HouseHoldGlobalSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalSearchParameters globalSearchParams});
}

/// @nodoc
class __$$HouseHoldGlobalSearchEventImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsEventCopyWithImpl<$Res,
        _$HouseHoldGlobalSearchEventImpl>
    implements _$$HouseHoldGlobalSearchEventImplCopyWith<$Res> {
  __$$HouseHoldGlobalSearchEventImplCopyWithImpl(
      _$HouseHoldGlobalSearchEventImpl _value,
      $Res Function(_$HouseHoldGlobalSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalSearchParams = null,
  }) {
    return _then(_$HouseHoldGlobalSearchEventImpl(
      globalSearchParams: null == globalSearchParams
          ? _value.globalSearchParams
          : globalSearchParams // ignore: cast_nullable_to_non_nullable
              as GlobalSearchParameters,
    ));
  }
}

/// @nodoc

class _$HouseHoldGlobalSearchEventImpl implements HouseHoldGlobalSearchEvent {
  const _$HouseHoldGlobalSearchEventImpl({required this.globalSearchParams});

  @override
  final GlobalSearchParameters globalSearchParams;

  @override
  String toString() {
    return 'SearchHouseholdsEvent.houseHoldGlobalSearch(globalSearchParams: $globalSearchParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseHoldGlobalSearchEventImpl &&
            (identical(other.globalSearchParams, globalSearchParams) ||
                other.globalSearchParams == globalSearchParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, globalSearchParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseHoldGlobalSearchEventImplCopyWith<_$HouseHoldGlobalSearchEventImpl>
      get copyWith => __$$HouseHoldGlobalSearchEventImplCopyWithImpl<
          _$HouseHoldGlobalSearchEventImpl>(this, _$identity);

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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)
        searchByHouseholdHead,
    required TResult Function(double latitude, double longititude,
            String projectId, double maxRadius, int offset, int limit)
        searchByProximity,
    required TResult Function(String tag, String projectId) searchByTag,
    required TResult Function() clear,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        individualGlobalSearch,
    required TResult Function(GlobalSearchParameters globalSearchParams)
        houseHoldGlobalSearch,
  }) {
    return houseHoldGlobalSearch(globalSearchParams);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult? Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult? Function(String tag, String projectId)? searchByTag,
    TResult? Function()? clear,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult? Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
  }) {
    return houseHoldGlobalSearch?.call(globalSearchParams);
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
            double? maxRadius,
            String? tag,
            int offset,
            int limit)?
        searchByHouseholdHead,
    TResult Function(double latitude, double longititude, String projectId,
            double maxRadius, int offset, int limit)?
        searchByProximity,
    TResult Function(String tag, String projectId)? searchByTag,
    TResult Function()? clear,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        individualGlobalSearch,
    TResult Function(GlobalSearchParameters globalSearchParams)?
        houseHoldGlobalSearch,
    required TResult orElse(),
  }) {
    if (houseHoldGlobalSearch != null) {
      return houseHoldGlobalSearch(globalSearchParams);
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
    required TResult Function(IndividualGlobalSearchEvent value)
        individualGlobalSearch,
    required TResult Function(HouseHoldGlobalSearchEvent value)
        houseHoldGlobalSearch,
  }) {
    return houseHoldGlobalSearch(this);
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
    TResult? Function(IndividualGlobalSearchEvent value)?
        individualGlobalSearch,
    TResult? Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
  }) {
    return houseHoldGlobalSearch?.call(this);
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
    TResult Function(IndividualGlobalSearchEvent value)? individualGlobalSearch,
    TResult Function(HouseHoldGlobalSearchEvent value)? houseHoldGlobalSearch,
    required TResult orElse(),
  }) {
    if (houseHoldGlobalSearch != null) {
      return houseHoldGlobalSearch(this);
    }
    return orElse();
  }
}

abstract class HouseHoldGlobalSearchEvent implements SearchHouseholdsEvent {
  const factory HouseHoldGlobalSearchEvent(
          {required final GlobalSearchParameters globalSearchParams}) =
      _$HouseHoldGlobalSearchEventImpl;

  GlobalSearchParameters get globalSearchParams;
  @JsonKey(ignore: true)
  _$$HouseHoldGlobalSearchEventImplCopyWith<_$HouseHoldGlobalSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchHouseholdsState {
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  List<HouseholdMemberWrapper> get householdMembers =>
      throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

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
      {int offset,
      int limit,
      bool loading,
      String? searchQuery,
      String? tag,
      List<HouseholdMemberWrapper> householdMembers,
      int totalResults});
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
    Object? offset = null,
    Object? limit = null,
    Object? loading = null,
    Object? searchQuery = freezed,
    Object? tag = freezed,
    Object? householdMembers = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
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
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHouseholdsStateImplCopyWith<$Res>
    implements $SearchHouseholdsStateCopyWith<$Res> {
  factory _$$SearchHouseholdsStateImplCopyWith(
          _$SearchHouseholdsStateImpl value,
          $Res Function(_$SearchHouseholdsStateImpl) then) =
      __$$SearchHouseholdsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int offset,
      int limit,
      bool loading,
      String? searchQuery,
      String? tag,
      List<HouseholdMemberWrapper> householdMembers,
      int totalResults});
}

/// @nodoc
class __$$SearchHouseholdsStateImplCopyWithImpl<$Res>
    extends _$SearchHouseholdsStateCopyWithImpl<$Res,
        _$SearchHouseholdsStateImpl>
    implements _$$SearchHouseholdsStateImplCopyWith<$Res> {
  __$$SearchHouseholdsStateImplCopyWithImpl(_$SearchHouseholdsStateImpl _value,
      $Res Function(_$SearchHouseholdsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
    Object? loading = null,
    Object? searchQuery = freezed,
    Object? tag = freezed,
    Object? householdMembers = null,
    Object? totalResults = null,
  }) {
    return _then(_$SearchHouseholdsStateImpl(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
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
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchHouseholdsStateImpl extends _SearchHouseholdsState {
  const _$SearchHouseholdsStateImpl(
      {this.offset = 0,
      this.limit = 10,
      this.loading = false,
      this.searchQuery,
      this.tag,
      final List<HouseholdMemberWrapper> householdMembers = const [],
      this.totalResults = 0})
      : _householdMembers = householdMembers,
        super._();

  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int limit;
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
    if (_householdMembers is EqualUnmodifiableListView)
      return _householdMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdMembers);
  }

  @override
  @JsonKey()
  final int totalResults;

  @override
  String toString() {
    return 'SearchHouseholdsState(offset: $offset, limit: $limit, loading: $loading, searchQuery: $searchQuery, tag: $tag, householdMembers: $householdMembers, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHouseholdsStateImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality()
                .equals(other._householdMembers, _householdMembers) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      offset,
      limit,
      loading,
      searchQuery,
      tag,
      const DeepCollectionEquality().hash(_householdMembers),
      totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHouseholdsStateImplCopyWith<_$SearchHouseholdsStateImpl>
      get copyWith => __$$SearchHouseholdsStateImplCopyWithImpl<
          _$SearchHouseholdsStateImpl>(this, _$identity);
}

abstract class _SearchHouseholdsState extends SearchHouseholdsState {
  const factory _SearchHouseholdsState(
      {final int offset,
      final int limit,
      final bool loading,
      final String? searchQuery,
      final String? tag,
      final List<HouseholdMemberWrapper> householdMembers,
      final int totalResults}) = _$SearchHouseholdsStateImpl;
  const _SearchHouseholdsState._() : super._();

  @override
  int get offset;
  @override
  int get limit;
  @override
  bool get loading;
  @override
  String? get searchQuery;
  @override
  String? get tag;
  @override
  List<HouseholdMemberWrapper> get householdMembers;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$SearchHouseholdsStateImplCopyWith<_$SearchHouseholdsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdMemberWrapper {
  HouseholdModel? get household => throw _privateConstructorUsedError;
  IndividualModel? get headOfHousehold => throw _privateConstructorUsedError;
  List<IndividualModel>? get members => throw _privateConstructorUsedError;
  List<ProjectBeneficiaryModel>? get projectBeneficiaries =>
      throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<SideEffectModel>? get sideEffects => throw _privateConstructorUsedError;
  List<ReferralModel>? get referrals => throw _privateConstructorUsedError;
  List<ServiceModel>? get householdChecklists =>
      throw _privateConstructorUsedError;
  List<ServiceModel>? get individualChecklists =>
      throw _privateConstructorUsedError;

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
      {HouseholdModel? household,
      IndividualModel? headOfHousehold,
      List<IndividualModel>? members,
      List<ProjectBeneficiaryModel>? projectBeneficiaries,
      double? distance,
      List<TaskModel>? tasks,
      List<SideEffectModel>? sideEffects,
      List<ReferralModel>? referrals,
      List<ServiceModel>? householdChecklists,
      List<ServiceModel>? individualChecklists});
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
    Object? household = freezed,
    Object? headOfHousehold = freezed,
    Object? members = freezed,
    Object? projectBeneficiaries = freezed,
    Object? distance = freezed,
    Object? tasks = freezed,
    Object? sideEffects = freezed,
    Object? referrals = freezed,
    Object? householdChecklists = freezed,
    Object? individualChecklists = freezed,
  }) {
    return _then(_value.copyWith(
      household: freezed == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as HouseholdModel?,
      headOfHousehold: freezed == headOfHousehold
          ? _value.headOfHousehold
          : headOfHousehold // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>?,
      projectBeneficiaries: freezed == projectBeneficiaries
          ? _value.projectBeneficiaries
          : projectBeneficiaries // ignore: cast_nullable_to_non_nullable
              as List<ProjectBeneficiaryModel>?,
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
      householdChecklists: freezed == householdChecklists
          ? _value.householdChecklists
          : householdChecklists // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
      individualChecklists: freezed == individualChecklists
          ? _value.individualChecklists
          : individualChecklists // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdMemberWrapperImplCopyWith<$Res>
    implements $HouseholdMemberWrapperCopyWith<$Res> {
  factory _$$HouseholdMemberWrapperImplCopyWith(
          _$HouseholdMemberWrapperImpl value,
          $Res Function(_$HouseholdMemberWrapperImpl) then) =
      __$$HouseholdMemberWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HouseholdModel? household,
      IndividualModel? headOfHousehold,
      List<IndividualModel>? members,
      List<ProjectBeneficiaryModel>? projectBeneficiaries,
      double? distance,
      List<TaskModel>? tasks,
      List<SideEffectModel>? sideEffects,
      List<ReferralModel>? referrals,
      List<ServiceModel>? householdChecklists,
      List<ServiceModel>? individualChecklists});
}

/// @nodoc
class __$$HouseholdMemberWrapperImplCopyWithImpl<$Res>
    extends _$HouseholdMemberWrapperCopyWithImpl<$Res,
        _$HouseholdMemberWrapperImpl>
    implements _$$HouseholdMemberWrapperImplCopyWith<$Res> {
  __$$HouseholdMemberWrapperImplCopyWithImpl(
      _$HouseholdMemberWrapperImpl _value,
      $Res Function(_$HouseholdMemberWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? household = freezed,
    Object? headOfHousehold = freezed,
    Object? members = freezed,
    Object? projectBeneficiaries = freezed,
    Object? distance = freezed,
    Object? tasks = freezed,
    Object? sideEffects = freezed,
    Object? referrals = freezed,
    Object? householdChecklists = freezed,
    Object? individualChecklists = freezed,
  }) {
    return _then(_$HouseholdMemberWrapperImpl(
      household: freezed == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as HouseholdModel?,
      headOfHousehold: freezed == headOfHousehold
          ? _value.headOfHousehold
          : headOfHousehold // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>?,
      projectBeneficiaries: freezed == projectBeneficiaries
          ? _value._projectBeneficiaries
          : projectBeneficiaries // ignore: cast_nullable_to_non_nullable
              as List<ProjectBeneficiaryModel>?,
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
      householdChecklists: freezed == householdChecklists
          ? _value._householdChecklists
          : householdChecklists // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
      individualChecklists: freezed == individualChecklists
          ? _value._individualChecklists
          : individualChecklists // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>?,
    ));
  }
}

/// @nodoc

class _$HouseholdMemberWrapperImpl implements _HouseholdMemberWrapper {
  const _$HouseholdMemberWrapperImpl(
      {this.household,
      this.headOfHousehold,
      final List<IndividualModel>? members,
      final List<ProjectBeneficiaryModel>? projectBeneficiaries,
      this.distance,
      final List<TaskModel>? tasks,
      final List<SideEffectModel>? sideEffects,
      final List<ReferralModel>? referrals,
      final List<ServiceModel>? householdChecklists,
      final List<ServiceModel>? individualChecklists})
      : _members = members,
        _projectBeneficiaries = projectBeneficiaries,
        _tasks = tasks,
        _sideEffects = sideEffects,
        _referrals = referrals,
        _householdChecklists = householdChecklists,
        _individualChecklists = individualChecklists;

  @override
  final HouseholdModel? household;
  @override
  final IndividualModel? headOfHousehold;
  final List<IndividualModel>? _members;
  @override
  List<IndividualModel>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectBeneficiaryModel>? _projectBeneficiaries;
  @override
  List<ProjectBeneficiaryModel>? get projectBeneficiaries {
    final value = _projectBeneficiaries;
    if (value == null) return null;
    if (_projectBeneficiaries is EqualUnmodifiableListView)
      return _projectBeneficiaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? distance;
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SideEffectModel>? _sideEffects;
  @override
  List<SideEffectModel>? get sideEffects {
    final value = _sideEffects;
    if (value == null) return null;
    if (_sideEffects is EqualUnmodifiableListView) return _sideEffects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReferralModel>? _referrals;
  @override
  List<ReferralModel>? get referrals {
    final value = _referrals;
    if (value == null) return null;
    if (_referrals is EqualUnmodifiableListView) return _referrals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ServiceModel>? _householdChecklists;
  @override
  List<ServiceModel>? get householdChecklists {
    final value = _householdChecklists;
    if (value == null) return null;
    if (_householdChecklists is EqualUnmodifiableListView)
      return _householdChecklists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ServiceModel>? _individualChecklists;
  @override
  List<ServiceModel>? get individualChecklists {
    final value = _individualChecklists;
    if (value == null) return null;
    if (_individualChecklists is EqualUnmodifiableListView)
      return _individualChecklists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HouseholdMemberWrapper(household: $household, headOfHousehold: $headOfHousehold, members: $members, projectBeneficiaries: $projectBeneficiaries, distance: $distance, tasks: $tasks, sideEffects: $sideEffects, referrals: $referrals, householdChecklists: $householdChecklists, individualChecklists: $individualChecklists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdMemberWrapperImpl &&
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
                .equals(other._referrals, _referrals) &&
            const DeepCollectionEquality()
                .equals(other._householdChecklists, _householdChecklists) &&
            const DeepCollectionEquality()
                .equals(other._individualChecklists, _individualChecklists));
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
      const DeepCollectionEquality().hash(_referrals),
      const DeepCollectionEquality().hash(_householdChecklists),
      const DeepCollectionEquality().hash(_individualChecklists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdMemberWrapperImplCopyWith<_$HouseholdMemberWrapperImpl>
      get copyWith => __$$HouseholdMemberWrapperImplCopyWithImpl<
          _$HouseholdMemberWrapperImpl>(this, _$identity);
}

abstract class _HouseholdMemberWrapper implements HouseholdMemberWrapper {
  const factory _HouseholdMemberWrapper(
          {final HouseholdModel? household,
          final IndividualModel? headOfHousehold,
          final List<IndividualModel>? members,
          final List<ProjectBeneficiaryModel>? projectBeneficiaries,
          final double? distance,
          final List<TaskModel>? tasks,
          final List<SideEffectModel>? sideEffects,
          final List<ReferralModel>? referrals,
          final List<ServiceModel>? householdChecklists,
          final List<ServiceModel>? individualChecklists}) =
      _$HouseholdMemberWrapperImpl;

  @override
  HouseholdModel? get household;
  @override
  IndividualModel? get headOfHousehold;
  @override
  List<IndividualModel>? get members;
  @override
  List<ProjectBeneficiaryModel>? get projectBeneficiaries;
  @override
  double? get distance;
  @override
  List<TaskModel>? get tasks;
  @override
  List<SideEffectModel>? get sideEffects;
  @override
  List<ReferralModel>? get referrals;
  @override
  List<ServiceModel>? get householdChecklists;
  @override
  List<ServiceModel>? get individualChecklists;
  @override
  @JsonKey(ignore: true)
  _$$HouseholdMemberWrapperImplCopyWith<_$HouseholdMemberWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

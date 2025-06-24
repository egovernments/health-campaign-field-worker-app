// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_wrapper_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationWrapperEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)
        loadFromGlobal,
    required TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)
        fetchDeliveryDetails,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult? Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(FetchDeliveryDetails value) fetchDeliveryDetails,
    required TResult Function(RegistrationWrapperClear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult? Function(RegistrationWrapperClear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult Function(RegistrationWrapperClear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationWrapperEventCopyWith<$Res> {
  factory $RegistrationWrapperEventCopyWith(RegistrationWrapperEvent value,
          $Res Function(RegistrationWrapperEvent) then) =
      _$RegistrationWrapperEventCopyWithImpl<$Res, RegistrationWrapperEvent>;
}

/// @nodoc
class _$RegistrationWrapperEventCopyWithImpl<$Res,
        $Val extends RegistrationWrapperEvent>
    implements $RegistrationWrapperEventCopyWith<$Res> {
  _$RegistrationWrapperEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegistrationWrapperLoadFromGlobalImplCopyWith<$Res> {
  factory _$$RegistrationWrapperLoadFromGlobalImplCopyWith(
          _$RegistrationWrapperLoadFromGlobalImpl value,
          $Res Function(_$RegistrationWrapperLoadFromGlobalImpl) then) =
      __$$RegistrationWrapperLoadFromGlobalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalSearchParameters searchParams, String? beneficiaryType});

  $GlobalSearchParametersCopyWith<$Res> get searchParams;
}

/// @nodoc
class __$$RegistrationWrapperLoadFromGlobalImplCopyWithImpl<$Res>
    extends _$RegistrationWrapperEventCopyWithImpl<$Res,
        _$RegistrationWrapperLoadFromGlobalImpl>
    implements _$$RegistrationWrapperLoadFromGlobalImplCopyWith<$Res> {
  __$$RegistrationWrapperLoadFromGlobalImplCopyWithImpl(
      _$RegistrationWrapperLoadFromGlobalImpl _value,
      $Res Function(_$RegistrationWrapperLoadFromGlobalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchParams = null,
    Object? beneficiaryType = freezed,
  }) {
    return _then(_$RegistrationWrapperLoadFromGlobalImpl(
      searchParams: null == searchParams
          ? _value.searchParams
          : searchParams // ignore: cast_nullable_to_non_nullable
              as GlobalSearchParameters,
      beneficiaryType: freezed == beneficiaryType
          ? _value.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GlobalSearchParametersCopyWith<$Res> get searchParams {
    return $GlobalSearchParametersCopyWith<$Res>(_value.searchParams, (value) {
      return _then(_value.copyWith(searchParams: value));
    });
  }
}

/// @nodoc

class _$RegistrationWrapperLoadFromGlobalImpl
    implements RegistrationWrapperLoadFromGlobal {
  const _$RegistrationWrapperLoadFromGlobalImpl(
      {required this.searchParams, this.beneficiaryType});

  @override
  final GlobalSearchParameters searchParams;
  @override
  final String? beneficiaryType;

  @override
  String toString() {
    return 'RegistrationWrapperEvent.loadFromGlobal(searchParams: $searchParams, beneficiaryType: $beneficiaryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationWrapperLoadFromGlobalImpl &&
            (identical(other.searchParams, searchParams) ||
                other.searchParams == searchParams) &&
            (identical(other.beneficiaryType, beneficiaryType) ||
                other.beneficiaryType == beneficiaryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchParams, beneficiaryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationWrapperLoadFromGlobalImplCopyWith<
          _$RegistrationWrapperLoadFromGlobalImpl>
      get copyWith => __$$RegistrationWrapperLoadFromGlobalImplCopyWithImpl<
          _$RegistrationWrapperLoadFromGlobalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)
        loadFromGlobal,
    required TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)
        fetchDeliveryDetails,
    required TResult Function() clear,
  }) {
    return loadFromGlobal(searchParams, beneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult? Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult? Function()? clear,
  }) {
    return loadFromGlobal?.call(searchParams, beneficiaryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (loadFromGlobal != null) {
      return loadFromGlobal(searchParams, beneficiaryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(FetchDeliveryDetails value) fetchDeliveryDetails,
    required TResult Function(RegistrationWrapperClear value) clear,
  }) {
    return loadFromGlobal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult? Function(RegistrationWrapperClear value)? clear,
  }) {
    return loadFromGlobal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult Function(RegistrationWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (loadFromGlobal != null) {
      return loadFromGlobal(this);
    }
    return orElse();
  }
}

abstract class RegistrationWrapperLoadFromGlobal
    implements RegistrationWrapperEvent {
  const factory RegistrationWrapperLoadFromGlobal(
      {required final GlobalSearchParameters searchParams,
      final String? beneficiaryType}) = _$RegistrationWrapperLoadFromGlobalImpl;

  GlobalSearchParameters get searchParams;
  String? get beneficiaryType;
  @JsonKey(ignore: true)
  _$$RegistrationWrapperLoadFromGlobalImplCopyWith<
          _$RegistrationWrapperLoadFromGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchDeliveryDetailsImplCopyWith<$Res> {
  factory _$$FetchDeliveryDetailsImplCopyWith(_$FetchDeliveryDetailsImpl value,
          $Res Function(_$FetchDeliveryDetailsImpl) then) =
      __$$FetchDeliveryDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {HouseholdWrapper householdWrapper,
      IndividualModel? selectedIndividual,
      String? beneficiaryType,
      String projectId});

  $HouseholdWrapperCopyWith<$Res> get householdWrapper;
}

/// @nodoc
class __$$FetchDeliveryDetailsImplCopyWithImpl<$Res>
    extends _$RegistrationWrapperEventCopyWithImpl<$Res,
        _$FetchDeliveryDetailsImpl>
    implements _$$FetchDeliveryDetailsImplCopyWith<$Res> {
  __$$FetchDeliveryDetailsImplCopyWithImpl(_$FetchDeliveryDetailsImpl _value,
      $Res Function(_$FetchDeliveryDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdWrapper = null,
    Object? selectedIndividual = freezed,
    Object? beneficiaryType = freezed,
    Object? projectId = null,
  }) {
    return _then(_$FetchDeliveryDetailsImpl(
      householdWrapper: null == householdWrapper
          ? _value.householdWrapper
          : householdWrapper // ignore: cast_nullable_to_non_nullable
              as HouseholdWrapper,
      selectedIndividual: freezed == selectedIndividual
          ? _value.selectedIndividual
          : selectedIndividual // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      beneficiaryType: freezed == beneficiaryType
          ? _value.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $HouseholdWrapperCopyWith<$Res> get householdWrapper {
    return $HouseholdWrapperCopyWith<$Res>(_value.householdWrapper, (value) {
      return _then(_value.copyWith(householdWrapper: value));
    });
  }
}

/// @nodoc

class _$FetchDeliveryDetailsImpl implements FetchDeliveryDetails {
  const _$FetchDeliveryDetailsImpl(
      {required this.householdWrapper,
      required this.selectedIndividual,
      this.beneficiaryType,
      required this.projectId});

  @override
  final HouseholdWrapper householdWrapper;
  @override
  final IndividualModel? selectedIndividual;
  @override
  final String? beneficiaryType;
  @override
  final String projectId;

  @override
  String toString() {
    return 'RegistrationWrapperEvent.fetchDeliveryDetails(householdWrapper: $householdWrapper, selectedIndividual: $selectedIndividual, beneficiaryType: $beneficiaryType, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDeliveryDetailsImpl &&
            (identical(other.householdWrapper, householdWrapper) ||
                other.householdWrapper == householdWrapper) &&
            (identical(other.selectedIndividual, selectedIndividual) ||
                other.selectedIndividual == selectedIndividual) &&
            (identical(other.beneficiaryType, beneficiaryType) ||
                other.beneficiaryType == beneficiaryType) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, householdWrapper,
      selectedIndividual, beneficiaryType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDeliveryDetailsImplCopyWith<_$FetchDeliveryDetailsImpl>
      get copyWith =>
          __$$FetchDeliveryDetailsImplCopyWithImpl<_$FetchDeliveryDetailsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)
        loadFromGlobal,
    required TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)
        fetchDeliveryDetails,
    required TResult Function() clear,
  }) {
    return fetchDeliveryDetails(
        householdWrapper, selectedIndividual, beneficiaryType, projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult? Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult? Function()? clear,
  }) {
    return fetchDeliveryDetails?.call(
        householdWrapper, selectedIndividual, beneficiaryType, projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (fetchDeliveryDetails != null) {
      return fetchDeliveryDetails(
          householdWrapper, selectedIndividual, beneficiaryType, projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(FetchDeliveryDetails value) fetchDeliveryDetails,
    required TResult Function(RegistrationWrapperClear value) clear,
  }) {
    return fetchDeliveryDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult? Function(RegistrationWrapperClear value)? clear,
  }) {
    return fetchDeliveryDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult Function(RegistrationWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (fetchDeliveryDetails != null) {
      return fetchDeliveryDetails(this);
    }
    return orElse();
  }
}

abstract class FetchDeliveryDetails implements RegistrationWrapperEvent {
  const factory FetchDeliveryDetails(
      {required final HouseholdWrapper householdWrapper,
      required final IndividualModel? selectedIndividual,
      final String? beneficiaryType,
      required final String projectId}) = _$FetchDeliveryDetailsImpl;

  HouseholdWrapper get householdWrapper;
  IndividualModel? get selectedIndividual;
  String? get beneficiaryType;
  String get projectId;
  @JsonKey(ignore: true)
  _$$FetchDeliveryDetailsImplCopyWith<_$FetchDeliveryDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegistrationWrapperClearImplCopyWith<$Res> {
  factory _$$RegistrationWrapperClearImplCopyWith(
          _$RegistrationWrapperClearImpl value,
          $Res Function(_$RegistrationWrapperClearImpl) then) =
      __$$RegistrationWrapperClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegistrationWrapperClearImplCopyWithImpl<$Res>
    extends _$RegistrationWrapperEventCopyWithImpl<$Res,
        _$RegistrationWrapperClearImpl>
    implements _$$RegistrationWrapperClearImplCopyWith<$Res> {
  __$$RegistrationWrapperClearImplCopyWithImpl(
      _$RegistrationWrapperClearImpl _value,
      $Res Function(_$RegistrationWrapperClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegistrationWrapperClearImpl implements RegistrationWrapperClear {
  const _$RegistrationWrapperClearImpl();

  @override
  String toString() {
    return 'RegistrationWrapperEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationWrapperClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)
        loadFromGlobal,
    required TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)
        fetchDeliveryDetails,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult? Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            GlobalSearchParameters searchParams, String? beneficiaryType)?
        loadFromGlobal,
    TResult Function(
            HouseholdWrapper householdWrapper,
            IndividualModel? selectedIndividual,
            String? beneficiaryType,
            String projectId)?
        fetchDeliveryDetails,
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
    required TResult Function(RegistrationWrapperLoadFromGlobal value)
        loadFromGlobal,
    required TResult Function(FetchDeliveryDetails value) fetchDeliveryDetails,
    required TResult Function(RegistrationWrapperClear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult? Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult? Function(RegistrationWrapperClear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationWrapperLoadFromGlobal value)? loadFromGlobal,
    TResult Function(FetchDeliveryDetails value)? fetchDeliveryDetails,
    TResult Function(RegistrationWrapperClear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class RegistrationWrapperClear implements RegistrationWrapperEvent {
  const factory RegistrationWrapperClear() = _$RegistrationWrapperClearImpl;
}

/// @nodoc
mixin _$RegistrationWrapperState {
  bool get loading => throw _privateConstructorUsedError;
  List<HouseholdWrapper> get householdMembers =>
      throw _privateConstructorUsedError;
  IndividualModel? get selectedIndividual => throw _privateConstructorUsedError;
  DeliveryWrapper? get deliveryWrapper => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationWrapperStateCopyWith<RegistrationWrapperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationWrapperStateCopyWith<$Res> {
  factory $RegistrationWrapperStateCopyWith(RegistrationWrapperState value,
          $Res Function(RegistrationWrapperState) then) =
      _$RegistrationWrapperStateCopyWithImpl<$Res, RegistrationWrapperState>;
  @useResult
  $Res call(
      {bool loading,
      List<HouseholdWrapper> householdMembers,
      IndividualModel? selectedIndividual,
      DeliveryWrapper? deliveryWrapper,
      int? offset,
      int? limit,
      String? error,
      int totalCount});

  $DeliveryWrapperCopyWith<$Res>? get deliveryWrapper;
}

/// @nodoc
class _$RegistrationWrapperStateCopyWithImpl<$Res,
        $Val extends RegistrationWrapperState>
    implements $RegistrationWrapperStateCopyWith<$Res> {
  _$RegistrationWrapperStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? householdMembers = null,
    Object? selectedIndividual = freezed,
    Object? deliveryWrapper = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? error = freezed,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMembers: null == householdMembers
          ? _value.householdMembers
          : householdMembers // ignore: cast_nullable_to_non_nullable
              as List<HouseholdWrapper>,
      selectedIndividual: freezed == selectedIndividual
          ? _value.selectedIndividual
          : selectedIndividual // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      deliveryWrapper: freezed == deliveryWrapper
          ? _value.deliveryWrapper
          : deliveryWrapper // ignore: cast_nullable_to_non_nullable
              as DeliveryWrapper?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryWrapperCopyWith<$Res>? get deliveryWrapper {
    if (_value.deliveryWrapper == null) {
      return null;
    }

    return $DeliveryWrapperCopyWith<$Res>(_value.deliveryWrapper!, (value) {
      return _then(_value.copyWith(deliveryWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegistrationWrapperStateImplCopyWith<$Res>
    implements $RegistrationWrapperStateCopyWith<$Res> {
  factory _$$RegistrationWrapperStateImplCopyWith(
          _$RegistrationWrapperStateImpl value,
          $Res Function(_$RegistrationWrapperStateImpl) then) =
      __$$RegistrationWrapperStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<HouseholdWrapper> householdMembers,
      IndividualModel? selectedIndividual,
      DeliveryWrapper? deliveryWrapper,
      int? offset,
      int? limit,
      String? error,
      int totalCount});

  @override
  $DeliveryWrapperCopyWith<$Res>? get deliveryWrapper;
}

/// @nodoc
class __$$RegistrationWrapperStateImplCopyWithImpl<$Res>
    extends _$RegistrationWrapperStateCopyWithImpl<$Res,
        _$RegistrationWrapperStateImpl>
    implements _$$RegistrationWrapperStateImplCopyWith<$Res> {
  __$$RegistrationWrapperStateImplCopyWithImpl(
      _$RegistrationWrapperStateImpl _value,
      $Res Function(_$RegistrationWrapperStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? householdMembers = null,
    Object? selectedIndividual = freezed,
    Object? deliveryWrapper = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? error = freezed,
    Object? totalCount = null,
  }) {
    return _then(_$RegistrationWrapperStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      householdMembers: null == householdMembers
          ? _value._householdMembers
          : householdMembers // ignore: cast_nullable_to_non_nullable
              as List<HouseholdWrapper>,
      selectedIndividual: freezed == selectedIndividual
          ? _value.selectedIndividual
          : selectedIndividual // ignore: cast_nullable_to_non_nullable
              as IndividualModel?,
      deliveryWrapper: freezed == deliveryWrapper
          ? _value.deliveryWrapper
          : deliveryWrapper // ignore: cast_nullable_to_non_nullable
              as DeliveryWrapper?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RegistrationWrapperStateImpl implements _RegistrationWrapperState {
  const _$RegistrationWrapperStateImpl(
      {this.loading = false,
      final List<HouseholdWrapper> householdMembers = const [],
      this.selectedIndividual,
      this.deliveryWrapper,
      this.offset,
      this.limit,
      this.error,
      this.totalCount = 0})
      : _householdMembers = householdMembers;

  @override
  @JsonKey()
  final bool loading;
  final List<HouseholdWrapper> _householdMembers;
  @override
  @JsonKey()
  List<HouseholdWrapper> get householdMembers {
    if (_householdMembers is EqualUnmodifiableListView)
      return _householdMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdMembers);
  }

  @override
  final IndividualModel? selectedIndividual;
  @override
  final DeliveryWrapper? deliveryWrapper;
  @override
  final int? offset;
  @override
  final int? limit;
  @override
  final String? error;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'RegistrationWrapperState(loading: $loading, householdMembers: $householdMembers, selectedIndividual: $selectedIndividual, deliveryWrapper: $deliveryWrapper, offset: $offset, limit: $limit, error: $error, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationWrapperStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._householdMembers, _householdMembers) &&
            (identical(other.selectedIndividual, selectedIndividual) ||
                other.selectedIndividual == selectedIndividual) &&
            (identical(other.deliveryWrapper, deliveryWrapper) ||
                other.deliveryWrapper == deliveryWrapper) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_householdMembers),
      selectedIndividual,
      deliveryWrapper,
      offset,
      limit,
      error,
      totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationWrapperStateImplCopyWith<_$RegistrationWrapperStateImpl>
      get copyWith => __$$RegistrationWrapperStateImplCopyWithImpl<
          _$RegistrationWrapperStateImpl>(this, _$identity);
}

abstract class _RegistrationWrapperState implements RegistrationWrapperState {
  const factory _RegistrationWrapperState(
      {final bool loading,
      final List<HouseholdWrapper> householdMembers,
      final IndividualModel? selectedIndividual,
      final DeliveryWrapper? deliveryWrapper,
      final int? offset,
      final int? limit,
      final String? error,
      final int totalCount}) = _$RegistrationWrapperStateImpl;

  @override
  bool get loading;
  @override
  List<HouseholdWrapper> get householdMembers;
  @override
  IndividualModel? get selectedIndividual;
  @override
  DeliveryWrapper? get deliveryWrapper;
  @override
  int? get offset;
  @override
  int? get limit;
  @override
  String? get error;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationWrapperStateImplCopyWith<_$RegistrationWrapperStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdWrapper {
  HouseholdModel? get household => throw _privateConstructorUsedError;
  IndividualModel? get headOfHousehold => throw _privateConstructorUsedError;
  List<HouseholdMemberModel>? get members => throw _privateConstructorUsedError;
  List<IndividualModel>? get individuals => throw _privateConstructorUsedError;
  List<ProjectBeneficiaryModel>? get projectBeneficiaries =>
      throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<SideEffectModel>? get sideEffects => throw _privateConstructorUsedError;
  List<ReferralModel>? get referrals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HouseholdWrapperCopyWith<HouseholdWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdWrapperCopyWith<$Res> {
  factory $HouseholdWrapperCopyWith(
          HouseholdWrapper value, $Res Function(HouseholdWrapper) then) =
      _$HouseholdWrapperCopyWithImpl<$Res, HouseholdWrapper>;
  @useResult
  $Res call(
      {HouseholdModel? household,
      IndividualModel? headOfHousehold,
      List<HouseholdMemberModel>? members,
      List<IndividualModel>? individuals,
      List<ProjectBeneficiaryModel>? projectBeneficiaries,
      double? distance,
      List<TaskModel>? tasks,
      List<SideEffectModel>? sideEffects,
      List<ReferralModel>? referrals});
}

/// @nodoc
class _$HouseholdWrapperCopyWithImpl<$Res, $Val extends HouseholdWrapper>
    implements $HouseholdWrapperCopyWith<$Res> {
  _$HouseholdWrapperCopyWithImpl(this._value, this._then);

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
    Object? individuals = freezed,
    Object? projectBeneficiaries = freezed,
    Object? distance = freezed,
    Object? tasks = freezed,
    Object? sideEffects = freezed,
    Object? referrals = freezed,
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
              as List<HouseholdMemberModel>?,
      individuals: freezed == individuals
          ? _value.individuals
          : individuals // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdWrapperImplCopyWith<$Res>
    implements $HouseholdWrapperCopyWith<$Res> {
  factory _$$HouseholdWrapperImplCopyWith(_$HouseholdWrapperImpl value,
          $Res Function(_$HouseholdWrapperImpl) then) =
      __$$HouseholdWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HouseholdModel? household,
      IndividualModel? headOfHousehold,
      List<HouseholdMemberModel>? members,
      List<IndividualModel>? individuals,
      List<ProjectBeneficiaryModel>? projectBeneficiaries,
      double? distance,
      List<TaskModel>? tasks,
      List<SideEffectModel>? sideEffects,
      List<ReferralModel>? referrals});
}

/// @nodoc
class __$$HouseholdWrapperImplCopyWithImpl<$Res>
    extends _$HouseholdWrapperCopyWithImpl<$Res, _$HouseholdWrapperImpl>
    implements _$$HouseholdWrapperImplCopyWith<$Res> {
  __$$HouseholdWrapperImplCopyWithImpl(_$HouseholdWrapperImpl _value,
      $Res Function(_$HouseholdWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? household = freezed,
    Object? headOfHousehold = freezed,
    Object? members = freezed,
    Object? individuals = freezed,
    Object? projectBeneficiaries = freezed,
    Object? distance = freezed,
    Object? tasks = freezed,
    Object? sideEffects = freezed,
    Object? referrals = freezed,
  }) {
    return _then(_$HouseholdWrapperImpl(
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
              as List<HouseholdMemberModel>?,
      individuals: freezed == individuals
          ? _value._individuals
          : individuals // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$HouseholdWrapperImpl implements _HouseholdWrapper {
  const _$HouseholdWrapperImpl(
      {this.household,
      this.headOfHousehold,
      final List<HouseholdMemberModel>? members,
      final List<IndividualModel>? individuals,
      final List<ProjectBeneficiaryModel>? projectBeneficiaries,
      this.distance,
      final List<TaskModel>? tasks,
      final List<SideEffectModel>? sideEffects,
      final List<ReferralModel>? referrals})
      : _members = members,
        _individuals = individuals,
        _projectBeneficiaries = projectBeneficiaries,
        _tasks = tasks,
        _sideEffects = sideEffects,
        _referrals = referrals;

  @override
  final HouseholdModel? household;
  @override
  final IndividualModel? headOfHousehold;
  final List<HouseholdMemberModel>? _members;
  @override
  List<HouseholdMemberModel>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IndividualModel>? _individuals;
  @override
  List<IndividualModel>? get individuals {
    final value = _individuals;
    if (value == null) return null;
    if (_individuals is EqualUnmodifiableListView) return _individuals;
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

  @override
  String toString() {
    return 'HouseholdWrapper(household: $household, headOfHousehold: $headOfHousehold, members: $members, individuals: $individuals, projectBeneficiaries: $projectBeneficiaries, distance: $distance, tasks: $tasks, sideEffects: $sideEffects, referrals: $referrals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdWrapperImpl &&
            (identical(other.household, household) ||
                other.household == household) &&
            (identical(other.headOfHousehold, headOfHousehold) ||
                other.headOfHousehold == headOfHousehold) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._individuals, _individuals) &&
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
      const DeepCollectionEquality().hash(_individuals),
      const DeepCollectionEquality().hash(_projectBeneficiaries),
      distance,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_sideEffects),
      const DeepCollectionEquality().hash(_referrals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdWrapperImplCopyWith<_$HouseholdWrapperImpl> get copyWith =>
      __$$HouseholdWrapperImplCopyWithImpl<_$HouseholdWrapperImpl>(
          this, _$identity);
}

abstract class _HouseholdWrapper implements HouseholdWrapper {
  const factory _HouseholdWrapper(
      {final HouseholdModel? household,
      final IndividualModel? headOfHousehold,
      final List<HouseholdMemberModel>? members,
      final List<IndividualModel>? individuals,
      final List<ProjectBeneficiaryModel>? projectBeneficiaries,
      final double? distance,
      final List<TaskModel>? tasks,
      final List<SideEffectModel>? sideEffects,
      final List<ReferralModel>? referrals}) = _$HouseholdWrapperImpl;

  @override
  HouseholdModel? get household;
  @override
  IndividualModel? get headOfHousehold;
  @override
  List<HouseholdMemberModel>? get members;
  @override
  List<IndividualModel>? get individuals;
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
  @JsonKey(ignore: true)
  _$$HouseholdWrapperImplCopyWith<_$HouseholdWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeliveryWrapper {
  int get cycle => throw _privateConstructorUsedError;
  int get dose => throw _privateConstructorUsedError;
  List<ProjectCycle>? get pastCycles => throw _privateConstructorUsedError;
  bool get hasCycleArrived => throw _privateConstructorUsedError;
  bool get isLastDoseOfCycle => throw _privateConstructorUsedError;
  List<TaskModel>? get tasks => throw _privateConstructorUsedError;
  List<ProjectCycleDelivery>? get futureDeliveries =>
      throw _privateConstructorUsedError;
  List<TaskModel>? get futureTask => throw _privateConstructorUsedError;
  TaskModel? get oldTask => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryWrapperCopyWith<DeliveryWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryWrapperCopyWith<$Res> {
  factory $DeliveryWrapperCopyWith(
          DeliveryWrapper value, $Res Function(DeliveryWrapper) then) =
      _$DeliveryWrapperCopyWithImpl<$Res, DeliveryWrapper>;
  @useResult
  $Res call(
      {int cycle,
      int dose,
      List<ProjectCycle>? pastCycles,
      bool hasCycleArrived,
      bool isLastDoseOfCycle,
      List<TaskModel>? tasks,
      List<ProjectCycleDelivery>? futureDeliveries,
      List<TaskModel>? futureTask,
      TaskModel? oldTask});
}

/// @nodoc
class _$DeliveryWrapperCopyWithImpl<$Res, $Val extends DeliveryWrapper>
    implements $DeliveryWrapperCopyWith<$Res> {
  _$DeliveryWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycle = null,
    Object? dose = null,
    Object? pastCycles = freezed,
    Object? hasCycleArrived = null,
    Object? isLastDoseOfCycle = null,
    Object? tasks = freezed,
    Object? futureDeliveries = freezed,
    Object? futureTask = freezed,
    Object? oldTask = freezed,
  }) {
    return _then(_value.copyWith(
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      pastCycles: freezed == pastCycles
          ? _value.pastCycles
          : pastCycles // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycle>?,
      hasCycleArrived: null == hasCycleArrived
          ? _value.hasCycleArrived
          : hasCycleArrived // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastDoseOfCycle: null == isLastDoseOfCycle
          ? _value.isLastDoseOfCycle
          : isLastDoseOfCycle // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value.futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycleDelivery>?,
      futureTask: freezed == futureTask
          ? _value.futureTask
          : futureTask // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      oldTask: freezed == oldTask
          ? _value.oldTask
          : oldTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryWrapperImplCopyWith<$Res>
    implements $DeliveryWrapperCopyWith<$Res> {
  factory _$$DeliveryWrapperImplCopyWith(_$DeliveryWrapperImpl value,
          $Res Function(_$DeliveryWrapperImpl) then) =
      __$$DeliveryWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cycle,
      int dose,
      List<ProjectCycle>? pastCycles,
      bool hasCycleArrived,
      bool isLastDoseOfCycle,
      List<TaskModel>? tasks,
      List<ProjectCycleDelivery>? futureDeliveries,
      List<TaskModel>? futureTask,
      TaskModel? oldTask});
}

/// @nodoc
class __$$DeliveryWrapperImplCopyWithImpl<$Res>
    extends _$DeliveryWrapperCopyWithImpl<$Res, _$DeliveryWrapperImpl>
    implements _$$DeliveryWrapperImplCopyWith<$Res> {
  __$$DeliveryWrapperImplCopyWithImpl(
      _$DeliveryWrapperImpl _value, $Res Function(_$DeliveryWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cycle = null,
    Object? dose = null,
    Object? pastCycles = freezed,
    Object? hasCycleArrived = null,
    Object? isLastDoseOfCycle = null,
    Object? tasks = freezed,
    Object? futureDeliveries = freezed,
    Object? futureTask = freezed,
    Object? oldTask = freezed,
  }) {
    return _then(_$DeliveryWrapperImpl(
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      pastCycles: freezed == pastCycles
          ? _value._pastCycles
          : pastCycles // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycle>?,
      hasCycleArrived: null == hasCycleArrived
          ? _value.hasCycleArrived
          : hasCycleArrived // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastDoseOfCycle: null == isLastDoseOfCycle
          ? _value.isLastDoseOfCycle
          : isLastDoseOfCycle // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      futureDeliveries: freezed == futureDeliveries
          ? _value._futureDeliveries
          : futureDeliveries // ignore: cast_nullable_to_non_nullable
              as List<ProjectCycleDelivery>?,
      futureTask: freezed == futureTask
          ? _value._futureTask
          : futureTask // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      oldTask: freezed == oldTask
          ? _value.oldTask
          : oldTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
    ));
  }
}

/// @nodoc

class _$DeliveryWrapperImpl implements _DeliveryWrapper {
  const _$DeliveryWrapperImpl(
      {this.cycle = 1,
      this.dose = 1,
      final List<ProjectCycle>? pastCycles,
      this.hasCycleArrived = true,
      this.isLastDoseOfCycle = false,
      final List<TaskModel>? tasks,
      final List<ProjectCycleDelivery>? futureDeliveries,
      final List<TaskModel>? futureTask,
      this.oldTask})
      : _pastCycles = pastCycles,
        _tasks = tasks,
        _futureDeliveries = futureDeliveries,
        _futureTask = futureTask;

  @override
  @JsonKey()
  final int cycle;
  @override
  @JsonKey()
  final int dose;
  final List<ProjectCycle>? _pastCycles;
  @override
  List<ProjectCycle>? get pastCycles {
    final value = _pastCycles;
    if (value == null) return null;
    if (_pastCycles is EqualUnmodifiableListView) return _pastCycles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool hasCycleArrived;
  @override
  @JsonKey()
  final bool isLastDoseOfCycle;
  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectCycleDelivery>? _futureDeliveries;
  @override
  List<ProjectCycleDelivery>? get futureDeliveries {
    final value = _futureDeliveries;
    if (value == null) return null;
    if (_futureDeliveries is EqualUnmodifiableListView)
      return _futureDeliveries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TaskModel>? _futureTask;
  @override
  List<TaskModel>? get futureTask {
    final value = _futureTask;
    if (value == null) return null;
    if (_futureTask is EqualUnmodifiableListView) return _futureTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TaskModel? oldTask;

  @override
  String toString() {
    return 'DeliveryWrapper(cycle: $cycle, dose: $dose, pastCycles: $pastCycles, hasCycleArrived: $hasCycleArrived, isLastDoseOfCycle: $isLastDoseOfCycle, tasks: $tasks, futureDeliveries: $futureDeliveries, futureTask: $futureTask, oldTask: $oldTask)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryWrapperImpl &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            const DeepCollectionEquality()
                .equals(other._pastCycles, _pastCycles) &&
            (identical(other.hasCycleArrived, hasCycleArrived) ||
                other.hasCycleArrived == hasCycleArrived) &&
            (identical(other.isLastDoseOfCycle, isLastDoseOfCycle) ||
                other.isLastDoseOfCycle == isLastDoseOfCycle) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._futureDeliveries, _futureDeliveries) &&
            const DeepCollectionEquality()
                .equals(other._futureTask, _futureTask) &&
            (identical(other.oldTask, oldTask) || other.oldTask == oldTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cycle,
      dose,
      const DeepCollectionEquality().hash(_pastCycles),
      hasCycleArrived,
      isLastDoseOfCycle,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_futureDeliveries),
      const DeepCollectionEquality().hash(_futureTask),
      oldTask);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryWrapperImplCopyWith<_$DeliveryWrapperImpl> get copyWith =>
      __$$DeliveryWrapperImplCopyWithImpl<_$DeliveryWrapperImpl>(
          this, _$identity);
}

abstract class _DeliveryWrapper implements DeliveryWrapper {
  const factory _DeliveryWrapper(
      {final int cycle,
      final int dose,
      final List<ProjectCycle>? pastCycles,
      final bool hasCycleArrived,
      final bool isLastDoseOfCycle,
      final List<TaskModel>? tasks,
      final List<ProjectCycleDelivery>? futureDeliveries,
      final List<TaskModel>? futureTask,
      final TaskModel? oldTask}) = _$DeliveryWrapperImpl;

  @override
  int get cycle;
  @override
  int get dose;
  @override
  List<ProjectCycle>? get pastCycles;
  @override
  bool get hasCycleArrived;
  @override
  bool get isLastDoseOfCycle;
  @override
  List<TaskModel>? get tasks;
  @override
  List<ProjectCycleDelivery>? get futureDeliveries;
  @override
  List<TaskModel>? get futureTask;
  @override
  TaskModel? get oldTask;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryWrapperImplCopyWith<_$DeliveryWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

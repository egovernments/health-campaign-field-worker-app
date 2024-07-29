// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordHFReferralEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)
        saveFacilityDetails,
    required TResult Function(HFReferralModel hfReferralModel)
        createReferralEntry,
    required TResult Function(HFReferralModel hfReferralModel) viewReferral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult? Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult? Function(HFReferralModel hfReferralModel)? viewReferral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult Function(HFReferralModel hfReferralModel)? viewReferral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)
        saveFacilityDetails,
    required TResult Function(RecordHFReferralCreateEntryEvent value)
        createReferralEntry,
    required TResult Function(RecordHFReferralViewEvent value) viewReferral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult? Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult? Function(RecordHFReferralViewEvent value)? viewReferral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult Function(RecordHFReferralViewEvent value)? viewReferral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordHFReferralEventCopyWith<$Res> {
  factory $RecordHFReferralEventCopyWith(RecordHFReferralEvent value,
          $Res Function(RecordHFReferralEvent) then) =
      _$RecordHFReferralEventCopyWithImpl<$Res, RecordHFReferralEvent>;
}

/// @nodoc
class _$RecordHFReferralEventCopyWithImpl<$Res,
        $Val extends RecordHFReferralEvent>
    implements $RecordHFReferralEventCopyWith<$Res> {
  _$RecordHFReferralEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecordHFReferralSaveFacilityDetailsEventImplCopyWith<$Res> {
  factory _$$RecordHFReferralSaveFacilityDetailsEventImplCopyWith(
          _$RecordHFReferralSaveFacilityDetailsEventImpl value,
          $Res Function(_$RecordHFReferralSaveFacilityDetailsEventImpl) then) =
      __$$RecordHFReferralSaveFacilityDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime dateOfEvaluation,
      String facilityId,
      String? healthFacilityCord,
      String? referredBy});
}

/// @nodoc
class __$$RecordHFReferralSaveFacilityDetailsEventImplCopyWithImpl<$Res>
    extends _$RecordHFReferralEventCopyWithImpl<$Res,
        _$RecordHFReferralSaveFacilityDetailsEventImpl>
    implements _$$RecordHFReferralSaveFacilityDetailsEventImplCopyWith<$Res> {
  __$$RecordHFReferralSaveFacilityDetailsEventImplCopyWithImpl(
      _$RecordHFReferralSaveFacilityDetailsEventImpl _value,
      $Res Function(_$RecordHFReferralSaveFacilityDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateOfEvaluation = null,
    Object? facilityId = null,
    Object? healthFacilityCord = freezed,
    Object? referredBy = freezed,
  }) {
    return _then(_$RecordHFReferralSaveFacilityDetailsEventImpl(
      dateOfEvaluation: null == dateOfEvaluation
          ? _value.dateOfEvaluation
          : dateOfEvaluation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      facilityId: null == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String,
      healthFacilityCord: freezed == healthFacilityCord
          ? _value.healthFacilityCord
          : healthFacilityCord // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralSaveFacilityDetailsEventImpl
    implements RecordHFReferralSaveFacilityDetailsEvent {
  const _$RecordHFReferralSaveFacilityDetailsEventImpl(
      {required this.dateOfEvaluation,
      required this.facilityId,
      this.healthFacilityCord,
      this.referredBy});

  @override
  final DateTime dateOfEvaluation;
  @override
  final String facilityId;
  @override
  final String? healthFacilityCord;
  @override
  final String? referredBy;

  @override
  String toString() {
    return 'RecordHFReferralEvent.saveFacilityDetails(dateOfEvaluation: $dateOfEvaluation, facilityId: $facilityId, healthFacilityCord: $healthFacilityCord, referredBy: $referredBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralSaveFacilityDetailsEventImpl &&
            (identical(other.dateOfEvaluation, dateOfEvaluation) ||
                other.dateOfEvaluation == dateOfEvaluation) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.healthFacilityCord, healthFacilityCord) ||
                other.healthFacilityCord == healthFacilityCord) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateOfEvaluation, facilityId,
      healthFacilityCord, referredBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralSaveFacilityDetailsEventImplCopyWith<
          _$RecordHFReferralSaveFacilityDetailsEventImpl>
      get copyWith =>
          __$$RecordHFReferralSaveFacilityDetailsEventImplCopyWithImpl<
              _$RecordHFReferralSaveFacilityDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)
        saveFacilityDetails,
    required TResult Function(HFReferralModel hfReferralModel)
        createReferralEntry,
    required TResult Function(HFReferralModel hfReferralModel) viewReferral,
  }) {
    return saveFacilityDetails(
        dateOfEvaluation, facilityId, healthFacilityCord, referredBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult? Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult? Function(HFReferralModel hfReferralModel)? viewReferral,
  }) {
    return saveFacilityDetails?.call(
        dateOfEvaluation, facilityId, healthFacilityCord, referredBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult Function(HFReferralModel hfReferralModel)? viewReferral,
    required TResult orElse(),
  }) {
    if (saveFacilityDetails != null) {
      return saveFacilityDetails(
          dateOfEvaluation, facilityId, healthFacilityCord, referredBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)
        saveFacilityDetails,
    required TResult Function(RecordHFReferralCreateEntryEvent value)
        createReferralEntry,
    required TResult Function(RecordHFReferralViewEvent value) viewReferral,
  }) {
    return saveFacilityDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult? Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult? Function(RecordHFReferralViewEvent value)? viewReferral,
  }) {
    return saveFacilityDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult Function(RecordHFReferralViewEvent value)? viewReferral,
    required TResult orElse(),
  }) {
    if (saveFacilityDetails != null) {
      return saveFacilityDetails(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralSaveFacilityDetailsEvent
    implements RecordHFReferralEvent {
  const factory RecordHFReferralSaveFacilityDetailsEvent(
          {required final DateTime dateOfEvaluation,
          required final String facilityId,
          final String? healthFacilityCord,
          final String? referredBy}) =
      _$RecordHFReferralSaveFacilityDetailsEventImpl;

  DateTime get dateOfEvaluation;
  String get facilityId;
  String? get healthFacilityCord;
  String? get referredBy;
  @JsonKey(ignore: true)
  _$$RecordHFReferralSaveFacilityDetailsEventImplCopyWith<
          _$RecordHFReferralSaveFacilityDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordHFReferralCreateEntryEventImplCopyWith<$Res> {
  factory _$$RecordHFReferralCreateEntryEventImplCopyWith(
          _$RecordHFReferralCreateEntryEventImpl value,
          $Res Function(_$RecordHFReferralCreateEntryEventImpl) then) =
      __$$RecordHFReferralCreateEntryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HFReferralModel hfReferralModel});
}

/// @nodoc
class __$$RecordHFReferralCreateEntryEventImplCopyWithImpl<$Res>
    extends _$RecordHFReferralEventCopyWithImpl<$Res,
        _$RecordHFReferralCreateEntryEventImpl>
    implements _$$RecordHFReferralCreateEntryEventImplCopyWith<$Res> {
  __$$RecordHFReferralCreateEntryEventImplCopyWithImpl(
      _$RecordHFReferralCreateEntryEventImpl _value,
      $Res Function(_$RecordHFReferralCreateEntryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hfReferralModel = null,
  }) {
    return _then(_$RecordHFReferralCreateEntryEventImpl(
      hfReferralModel: null == hfReferralModel
          ? _value.hfReferralModel
          : hfReferralModel // ignore: cast_nullable_to_non_nullable
              as HFReferralModel,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralCreateEntryEventImpl
    implements RecordHFReferralCreateEntryEvent {
  const _$RecordHFReferralCreateEntryEventImpl({required this.hfReferralModel});

  @override
  final HFReferralModel hfReferralModel;

  @override
  String toString() {
    return 'RecordHFReferralEvent.createReferralEntry(hfReferralModel: $hfReferralModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralCreateEntryEventImpl &&
            (identical(other.hfReferralModel, hfReferralModel) ||
                other.hfReferralModel == hfReferralModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hfReferralModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralCreateEntryEventImplCopyWith<
          _$RecordHFReferralCreateEntryEventImpl>
      get copyWith => __$$RecordHFReferralCreateEntryEventImplCopyWithImpl<
          _$RecordHFReferralCreateEntryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)
        saveFacilityDetails,
    required TResult Function(HFReferralModel hfReferralModel)
        createReferralEntry,
    required TResult Function(HFReferralModel hfReferralModel) viewReferral,
  }) {
    return createReferralEntry(hfReferralModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult? Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult? Function(HFReferralModel hfReferralModel)? viewReferral,
  }) {
    return createReferralEntry?.call(hfReferralModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult Function(HFReferralModel hfReferralModel)? viewReferral,
    required TResult orElse(),
  }) {
    if (createReferralEntry != null) {
      return createReferralEntry(hfReferralModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)
        saveFacilityDetails,
    required TResult Function(RecordHFReferralCreateEntryEvent value)
        createReferralEntry,
    required TResult Function(RecordHFReferralViewEvent value) viewReferral,
  }) {
    return createReferralEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult? Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult? Function(RecordHFReferralViewEvent value)? viewReferral,
  }) {
    return createReferralEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult Function(RecordHFReferralViewEvent value)? viewReferral,
    required TResult orElse(),
  }) {
    if (createReferralEntry != null) {
      return createReferralEntry(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralCreateEntryEvent
    implements RecordHFReferralEvent {
  const factory RecordHFReferralCreateEntryEvent(
          {required final HFReferralModel hfReferralModel}) =
      _$RecordHFReferralCreateEntryEventImpl;

  HFReferralModel get hfReferralModel;
  @JsonKey(ignore: true)
  _$$RecordHFReferralCreateEntryEventImplCopyWith<
          _$RecordHFReferralCreateEntryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordHFReferralViewEventImplCopyWith<$Res> {
  factory _$$RecordHFReferralViewEventImplCopyWith(
          _$RecordHFReferralViewEventImpl value,
          $Res Function(_$RecordHFReferralViewEventImpl) then) =
      __$$RecordHFReferralViewEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HFReferralModel hfReferralModel});
}

/// @nodoc
class __$$RecordHFReferralViewEventImplCopyWithImpl<$Res>
    extends _$RecordHFReferralEventCopyWithImpl<$Res,
        _$RecordHFReferralViewEventImpl>
    implements _$$RecordHFReferralViewEventImplCopyWith<$Res> {
  __$$RecordHFReferralViewEventImplCopyWithImpl(
      _$RecordHFReferralViewEventImpl _value,
      $Res Function(_$RecordHFReferralViewEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hfReferralModel = null,
  }) {
    return _then(_$RecordHFReferralViewEventImpl(
      hfReferralModel: null == hfReferralModel
          ? _value.hfReferralModel
          : hfReferralModel // ignore: cast_nullable_to_non_nullable
              as HFReferralModel,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralViewEventImpl implements RecordHFReferralViewEvent {
  const _$RecordHFReferralViewEventImpl({required this.hfReferralModel});

  @override
  final HFReferralModel hfReferralModel;

  @override
  String toString() {
    return 'RecordHFReferralEvent.viewReferral(hfReferralModel: $hfReferralModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralViewEventImpl &&
            (identical(other.hfReferralModel, hfReferralModel) ||
                other.hfReferralModel == hfReferralModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hfReferralModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralViewEventImplCopyWith<_$RecordHFReferralViewEventImpl>
      get copyWith => __$$RecordHFReferralViewEventImplCopyWithImpl<
          _$RecordHFReferralViewEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)
        saveFacilityDetails,
    required TResult Function(HFReferralModel hfReferralModel)
        createReferralEntry,
    required TResult Function(HFReferralModel hfReferralModel) viewReferral,
  }) {
    return viewReferral(hfReferralModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult? Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult? Function(HFReferralModel hfReferralModel)? viewReferral,
  }) {
    return viewReferral?.call(hfReferralModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateOfEvaluation, String facilityId,
            String? healthFacilityCord, String? referredBy)?
        saveFacilityDetails,
    TResult Function(HFReferralModel hfReferralModel)? createReferralEntry,
    TResult Function(HFReferralModel hfReferralModel)? viewReferral,
    required TResult orElse(),
  }) {
    if (viewReferral != null) {
      return viewReferral(hfReferralModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)
        saveFacilityDetails,
    required TResult Function(RecordHFReferralCreateEntryEvent value)
        createReferralEntry,
    required TResult Function(RecordHFReferralViewEvent value) viewReferral,
  }) {
    return viewReferral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult? Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult? Function(RecordHFReferralViewEvent value)? viewReferral,
  }) {
    return viewReferral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralSaveFacilityDetailsEvent value)?
        saveFacilityDetails,
    TResult Function(RecordHFReferralCreateEntryEvent value)?
        createReferralEntry,
    TResult Function(RecordHFReferralViewEvent value)? viewReferral,
    required TResult orElse(),
  }) {
    if (viewReferral != null) {
      return viewReferral(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralViewEvent implements RecordHFReferralEvent {
  const factory RecordHFReferralViewEvent(
          {required final HFReferralModel hfReferralModel}) =
      _$RecordHFReferralViewEventImpl;

  HFReferralModel get hfReferralModel;
  @JsonKey(ignore: true)
  _$$RecordHFReferralViewEventImplCopyWith<_$RecordHFReferralViewEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordHFReferralState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        create,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        persisted,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        view,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralCreateState value) create,
    required TResult Function(RecordHFReferralPersistedState value) persisted,
    required TResult Function(RecordHFReferralViewState value) view,
    required TResult Function(RecordHFReferralErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralCreateState value)? create,
    TResult? Function(RecordHFReferralPersistedState value)? persisted,
    TResult? Function(RecordHFReferralViewState value)? view,
    TResult? Function(RecordHFReferralErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralCreateState value)? create,
    TResult Function(RecordHFReferralPersistedState value)? persisted,
    TResult Function(RecordHFReferralViewState value)? view,
    TResult Function(RecordHFReferralErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordHFReferralStateCopyWith<$Res> {
  factory $RecordHFReferralStateCopyWith(RecordHFReferralState value,
          $Res Function(RecordHFReferralState) then) =
      _$RecordHFReferralStateCopyWithImpl<$Res, RecordHFReferralState>;
}

/// @nodoc
class _$RecordHFReferralStateCopyWithImpl<$Res,
        $Val extends RecordHFReferralState>
    implements $RecordHFReferralStateCopyWith<$Res> {
  _$RecordHFReferralStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecordHFReferralCreateStateImplCopyWith<$Res> {
  factory _$$RecordHFReferralCreateStateImplCopyWith(
          _$RecordHFReferralCreateStateImpl value,
          $Res Function(_$RecordHFReferralCreateStateImpl) then) =
      __$$RecordHFReferralCreateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool loading,
      String projectId,
      String? facilityId,
      DateTime? dateOfEvaluation,
      String? healthFacilityCord,
      String? referredBy,
      HFReferralModel? hfReferralModel,
      bool viewOnly});
}

/// @nodoc
class __$$RecordHFReferralCreateStateImplCopyWithImpl<$Res>
    extends _$RecordHFReferralStateCopyWithImpl<$Res,
        _$RecordHFReferralCreateStateImpl>
    implements _$$RecordHFReferralCreateStateImplCopyWith<$Res> {
  __$$RecordHFReferralCreateStateImplCopyWithImpl(
      _$RecordHFReferralCreateStateImpl _value,
      $Res Function(_$RecordHFReferralCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? projectId = null,
    Object? facilityId = freezed,
    Object? dateOfEvaluation = freezed,
    Object? healthFacilityCord = freezed,
    Object? referredBy = freezed,
    Object? hfReferralModel = freezed,
    Object? viewOnly = null,
  }) {
    return _then(_$RecordHFReferralCreateStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfEvaluation: freezed == dateOfEvaluation
          ? _value.dateOfEvaluation
          : dateOfEvaluation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      healthFacilityCord: freezed == healthFacilityCord
          ? _value.healthFacilityCord
          : healthFacilityCord // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      hfReferralModel: freezed == hfReferralModel
          ? _value.hfReferralModel
          : hfReferralModel // ignore: cast_nullable_to_non_nullable
              as HFReferralModel?,
      viewOnly: null == viewOnly
          ? _value.viewOnly
          : viewOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralCreateStateImpl implements RecordHFReferralCreateState {
  const _$RecordHFReferralCreateStateImpl(
      {this.loading = false,
      required this.projectId,
      this.facilityId,
      this.dateOfEvaluation,
      this.healthFacilityCord,
      this.referredBy,
      this.hfReferralModel,
      this.viewOnly = false});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String projectId;
  @override
  final String? facilityId;
  @override
  final DateTime? dateOfEvaluation;
  @override
  final String? healthFacilityCord;
  @override
  final String? referredBy;
  @override
  final HFReferralModel? hfReferralModel;
  @override
  @JsonKey()
  final bool viewOnly;

  @override
  String toString() {
    return 'RecordHFReferralState.create(loading: $loading, projectId: $projectId, facilityId: $facilityId, dateOfEvaluation: $dateOfEvaluation, healthFacilityCord: $healthFacilityCord, referredBy: $referredBy, hfReferralModel: $hfReferralModel, viewOnly: $viewOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralCreateStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.dateOfEvaluation, dateOfEvaluation) ||
                other.dateOfEvaluation == dateOfEvaluation) &&
            (identical(other.healthFacilityCord, healthFacilityCord) ||
                other.healthFacilityCord == healthFacilityCord) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.hfReferralModel, hfReferralModel) ||
                other.hfReferralModel == hfReferralModel) &&
            (identical(other.viewOnly, viewOnly) ||
                other.viewOnly == viewOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      projectId,
      facilityId,
      dateOfEvaluation,
      healthFacilityCord,
      referredBy,
      hfReferralModel,
      viewOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralCreateStateImplCopyWith<_$RecordHFReferralCreateStateImpl>
      get copyWith => __$$RecordHFReferralCreateStateImplCopyWithImpl<
          _$RecordHFReferralCreateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        create,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        persisted,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        view,
    required TResult Function(String? error) error,
  }) {
    return create(loading, projectId, facilityId, dateOfEvaluation,
        healthFacilityCord, referredBy, hfReferralModel, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult? Function(String? error)? error,
  }) {
    return create?.call(loading, projectId, facilityId, dateOfEvaluation,
        healthFacilityCord, referredBy, hfReferralModel, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(loading, projectId, facilityId, dateOfEvaluation,
          healthFacilityCord, referredBy, hfReferralModel, viewOnly);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralCreateState value) create,
    required TResult Function(RecordHFReferralPersistedState value) persisted,
    required TResult Function(RecordHFReferralViewState value) view,
    required TResult Function(RecordHFReferralErrorState value) error,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralCreateState value)? create,
    TResult? Function(RecordHFReferralPersistedState value)? persisted,
    TResult? Function(RecordHFReferralViewState value)? view,
    TResult? Function(RecordHFReferralErrorState value)? error,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralCreateState value)? create,
    TResult Function(RecordHFReferralPersistedState value)? persisted,
    TResult Function(RecordHFReferralViewState value)? view,
    TResult Function(RecordHFReferralErrorState value)? error,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralCreateState implements RecordHFReferralState {
  const factory RecordHFReferralCreateState(
      {final bool loading,
      required final String projectId,
      final String? facilityId,
      final DateTime? dateOfEvaluation,
      final String? healthFacilityCord,
      final String? referredBy,
      final HFReferralModel? hfReferralModel,
      final bool viewOnly}) = _$RecordHFReferralCreateStateImpl;

  bool get loading;
  String get projectId;
  String? get facilityId;
  DateTime? get dateOfEvaluation;
  String? get healthFacilityCord;
  String? get referredBy;
  HFReferralModel? get hfReferralModel;
  bool get viewOnly;
  @JsonKey(ignore: true)
  _$$RecordHFReferralCreateStateImplCopyWith<_$RecordHFReferralCreateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordHFReferralPersistedStateImplCopyWith<$Res> {
  factory _$$RecordHFReferralPersistedStateImplCopyWith(
          _$RecordHFReferralPersistedStateImpl value,
          $Res Function(_$RecordHFReferralPersistedStateImpl) then) =
      __$$RecordHFReferralPersistedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String? facilityId,
      DateTime? dateOfEvaluation,
      String? healthFacilityCord,
      String? referredBy,
      HFReferralModel? hfReferralModel,
      bool viewOnly});
}

/// @nodoc
class __$$RecordHFReferralPersistedStateImplCopyWithImpl<$Res>
    extends _$RecordHFReferralStateCopyWithImpl<$Res,
        _$RecordHFReferralPersistedStateImpl>
    implements _$$RecordHFReferralPersistedStateImplCopyWith<$Res> {
  __$$RecordHFReferralPersistedStateImplCopyWithImpl(
      _$RecordHFReferralPersistedStateImpl _value,
      $Res Function(_$RecordHFReferralPersistedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? facilityId = freezed,
    Object? dateOfEvaluation = freezed,
    Object? healthFacilityCord = freezed,
    Object? referredBy = freezed,
    Object? hfReferralModel = freezed,
    Object? viewOnly = null,
  }) {
    return _then(_$RecordHFReferralPersistedStateImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfEvaluation: freezed == dateOfEvaluation
          ? _value.dateOfEvaluation
          : dateOfEvaluation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      healthFacilityCord: freezed == healthFacilityCord
          ? _value.healthFacilityCord
          : healthFacilityCord // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      hfReferralModel: freezed == hfReferralModel
          ? _value.hfReferralModel
          : hfReferralModel // ignore: cast_nullable_to_non_nullable
              as HFReferralModel?,
      viewOnly: null == viewOnly
          ? _value.viewOnly
          : viewOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralPersistedStateImpl
    implements RecordHFReferralPersistedState {
  const _$RecordHFReferralPersistedStateImpl(
      {required this.projectId,
      this.facilityId,
      this.dateOfEvaluation,
      this.healthFacilityCord,
      this.referredBy,
      this.hfReferralModel,
      this.viewOnly = false});

  @override
  final String projectId;
  @override
  final String? facilityId;
  @override
  final DateTime? dateOfEvaluation;
  @override
  final String? healthFacilityCord;
  @override
  final String? referredBy;
  @override
  final HFReferralModel? hfReferralModel;
  @override
  @JsonKey()
  final bool viewOnly;

  @override
  String toString() {
    return 'RecordHFReferralState.persisted(projectId: $projectId, facilityId: $facilityId, dateOfEvaluation: $dateOfEvaluation, healthFacilityCord: $healthFacilityCord, referredBy: $referredBy, hfReferralModel: $hfReferralModel, viewOnly: $viewOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralPersistedStateImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.dateOfEvaluation, dateOfEvaluation) ||
                other.dateOfEvaluation == dateOfEvaluation) &&
            (identical(other.healthFacilityCord, healthFacilityCord) ||
                other.healthFacilityCord == healthFacilityCord) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.hfReferralModel, hfReferralModel) ||
                other.hfReferralModel == hfReferralModel) &&
            (identical(other.viewOnly, viewOnly) ||
                other.viewOnly == viewOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      facilityId,
      dateOfEvaluation,
      healthFacilityCord,
      referredBy,
      hfReferralModel,
      viewOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralPersistedStateImplCopyWith<
          _$RecordHFReferralPersistedStateImpl>
      get copyWith => __$$RecordHFReferralPersistedStateImplCopyWithImpl<
          _$RecordHFReferralPersistedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        create,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        persisted,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        view,
    required TResult Function(String? error) error,
  }) {
    return persisted(projectId, facilityId, dateOfEvaluation,
        healthFacilityCord, referredBy, hfReferralModel, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult? Function(String? error)? error,
  }) {
    return persisted?.call(projectId, facilityId, dateOfEvaluation,
        healthFacilityCord, referredBy, hfReferralModel, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(projectId, facilityId, dateOfEvaluation,
          healthFacilityCord, referredBy, hfReferralModel, viewOnly);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralCreateState value) create,
    required TResult Function(RecordHFReferralPersistedState value) persisted,
    required TResult Function(RecordHFReferralViewState value) view,
    required TResult Function(RecordHFReferralErrorState value) error,
  }) {
    return persisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralCreateState value)? create,
    TResult? Function(RecordHFReferralPersistedState value)? persisted,
    TResult? Function(RecordHFReferralViewState value)? view,
    TResult? Function(RecordHFReferralErrorState value)? error,
  }) {
    return persisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralCreateState value)? create,
    TResult Function(RecordHFReferralPersistedState value)? persisted,
    TResult Function(RecordHFReferralViewState value)? view,
    TResult Function(RecordHFReferralErrorState value)? error,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralPersistedState implements RecordHFReferralState {
  const factory RecordHFReferralPersistedState(
      {required final String projectId,
      final String? facilityId,
      final DateTime? dateOfEvaluation,
      final String? healthFacilityCord,
      final String? referredBy,
      final HFReferralModel? hfReferralModel,
      final bool viewOnly}) = _$RecordHFReferralPersistedStateImpl;

  String get projectId;
  String? get facilityId;
  DateTime? get dateOfEvaluation;
  String? get healthFacilityCord;
  String? get referredBy;
  HFReferralModel? get hfReferralModel;
  bool get viewOnly;
  @JsonKey(ignore: true)
  _$$RecordHFReferralPersistedStateImplCopyWith<
          _$RecordHFReferralPersistedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordHFReferralViewStateImplCopyWith<$Res> {
  factory _$$RecordHFReferralViewStateImplCopyWith(
          _$RecordHFReferralViewStateImpl value,
          $Res Function(_$RecordHFReferralViewStateImpl) then) =
      __$$RecordHFReferralViewStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String? facilityId,
      DateTime? dateOfEvaluation,
      String? healthFacilityCord,
      String? referredBy,
      HFReferralModel? hfReferralModel,
      bool viewOnly});
}

/// @nodoc
class __$$RecordHFReferralViewStateImplCopyWithImpl<$Res>
    extends _$RecordHFReferralStateCopyWithImpl<$Res,
        _$RecordHFReferralViewStateImpl>
    implements _$$RecordHFReferralViewStateImplCopyWith<$Res> {
  __$$RecordHFReferralViewStateImplCopyWithImpl(
      _$RecordHFReferralViewStateImpl _value,
      $Res Function(_$RecordHFReferralViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? facilityId = freezed,
    Object? dateOfEvaluation = freezed,
    Object? healthFacilityCord = freezed,
    Object? referredBy = freezed,
    Object? hfReferralModel = freezed,
    Object? viewOnly = null,
  }) {
    return _then(_$RecordHFReferralViewStateImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfEvaluation: freezed == dateOfEvaluation
          ? _value.dateOfEvaluation
          : dateOfEvaluation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      healthFacilityCord: freezed == healthFacilityCord
          ? _value.healthFacilityCord
          : healthFacilityCord // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      hfReferralModel: freezed == hfReferralModel
          ? _value.hfReferralModel
          : hfReferralModel // ignore: cast_nullable_to_non_nullable
              as HFReferralModel?,
      viewOnly: null == viewOnly
          ? _value.viewOnly
          : viewOnly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralViewStateImpl implements RecordHFReferralViewState {
  const _$RecordHFReferralViewStateImpl(
      {required this.projectId,
      this.facilityId,
      this.dateOfEvaluation,
      this.healthFacilityCord,
      this.referredBy,
      this.hfReferralModel,
      this.viewOnly = false});

  @override
  final String projectId;
  @override
  final String? facilityId;
  @override
  final DateTime? dateOfEvaluation;
  @override
  final String? healthFacilityCord;
  @override
  final String? referredBy;
  @override
  final HFReferralModel? hfReferralModel;
  @override
  @JsonKey()
  final bool viewOnly;

  @override
  String toString() {
    return 'RecordHFReferralState.view(projectId: $projectId, facilityId: $facilityId, dateOfEvaluation: $dateOfEvaluation, healthFacilityCord: $healthFacilityCord, referredBy: $referredBy, hfReferralModel: $hfReferralModel, viewOnly: $viewOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralViewStateImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.dateOfEvaluation, dateOfEvaluation) ||
                other.dateOfEvaluation == dateOfEvaluation) &&
            (identical(other.healthFacilityCord, healthFacilityCord) ||
                other.healthFacilityCord == healthFacilityCord) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.hfReferralModel, hfReferralModel) ||
                other.hfReferralModel == hfReferralModel) &&
            (identical(other.viewOnly, viewOnly) ||
                other.viewOnly == viewOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      facilityId,
      dateOfEvaluation,
      healthFacilityCord,
      referredBy,
      hfReferralModel,
      viewOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralViewStateImplCopyWith<_$RecordHFReferralViewStateImpl>
      get copyWith => __$$RecordHFReferralViewStateImplCopyWithImpl<
          _$RecordHFReferralViewStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        create,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        persisted,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        view,
    required TResult Function(String? error) error,
  }) {
    return view(projectId, facilityId, dateOfEvaluation, healthFacilityCord,
        referredBy, hfReferralModel, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult? Function(String? error)? error,
  }) {
    return view?.call(projectId, facilityId, dateOfEvaluation,
        healthFacilityCord, referredBy, hfReferralModel, viewOnly);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(projectId, facilityId, dateOfEvaluation, healthFacilityCord,
          referredBy, hfReferralModel, viewOnly);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralCreateState value) create,
    required TResult Function(RecordHFReferralPersistedState value) persisted,
    required TResult Function(RecordHFReferralViewState value) view,
    required TResult Function(RecordHFReferralErrorState value) error,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralCreateState value)? create,
    TResult? Function(RecordHFReferralPersistedState value)? persisted,
    TResult? Function(RecordHFReferralViewState value)? view,
    TResult? Function(RecordHFReferralErrorState value)? error,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralCreateState value)? create,
    TResult Function(RecordHFReferralPersistedState value)? persisted,
    TResult Function(RecordHFReferralViewState value)? view,
    TResult Function(RecordHFReferralErrorState value)? error,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralViewState implements RecordHFReferralState {
  const factory RecordHFReferralViewState(
      {required final String projectId,
      final String? facilityId,
      final DateTime? dateOfEvaluation,
      final String? healthFacilityCord,
      final String? referredBy,
      final HFReferralModel? hfReferralModel,
      final bool viewOnly}) = _$RecordHFReferralViewStateImpl;

  String get projectId;
  String? get facilityId;
  DateTime? get dateOfEvaluation;
  String? get healthFacilityCord;
  String? get referredBy;
  HFReferralModel? get hfReferralModel;
  bool get viewOnly;
  @JsonKey(ignore: true)
  _$$RecordHFReferralViewStateImplCopyWith<_$RecordHFReferralViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordHFReferralErrorStateImplCopyWith<$Res> {
  factory _$$RecordHFReferralErrorStateImplCopyWith(
          _$RecordHFReferralErrorStateImpl value,
          $Res Function(_$RecordHFReferralErrorStateImpl) then) =
      __$$RecordHFReferralErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$RecordHFReferralErrorStateImplCopyWithImpl<$Res>
    extends _$RecordHFReferralStateCopyWithImpl<$Res,
        _$RecordHFReferralErrorStateImpl>
    implements _$$RecordHFReferralErrorStateImplCopyWith<$Res> {
  __$$RecordHFReferralErrorStateImplCopyWithImpl(
      _$RecordHFReferralErrorStateImpl _value,
      $Res Function(_$RecordHFReferralErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RecordHFReferralErrorStateImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RecordHFReferralErrorStateImpl implements RecordHFReferralErrorState {
  const _$RecordHFReferralErrorStateImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'RecordHFReferralState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordHFReferralErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordHFReferralErrorStateImplCopyWith<_$RecordHFReferralErrorStateImpl>
      get copyWith => __$$RecordHFReferralErrorStateImplCopyWithImpl<
          _$RecordHFReferralErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        create,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        persisted,
    required TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)
        view,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult? Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        create,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        persisted,
    TResult Function(
            String projectId,
            String? facilityId,
            DateTime? dateOfEvaluation,
            String? healthFacilityCord,
            String? referredBy,
            HFReferralModel? hfReferralModel,
            bool viewOnly)?
        view,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordHFReferralCreateState value) create,
    required TResult Function(RecordHFReferralPersistedState value) persisted,
    required TResult Function(RecordHFReferralViewState value) view,
    required TResult Function(RecordHFReferralErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordHFReferralCreateState value)? create,
    TResult? Function(RecordHFReferralPersistedState value)? persisted,
    TResult? Function(RecordHFReferralViewState value)? view,
    TResult? Function(RecordHFReferralErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordHFReferralCreateState value)? create,
    TResult Function(RecordHFReferralPersistedState value)? persisted,
    TResult Function(RecordHFReferralViewState value)? view,
    TResult Function(RecordHFReferralErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RecordHFReferralErrorState implements RecordHFReferralState {
  const factory RecordHFReferralErrorState({final String? error}) =
      _$RecordHFReferralErrorStateImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$RecordHFReferralErrorStateImplCopyWith<_$RecordHFReferralErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

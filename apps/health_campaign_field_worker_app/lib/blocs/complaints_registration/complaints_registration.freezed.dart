// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaints_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComplaintsRegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String complaintType, String? otherComplaintDescription)
        saveComplaintType,
    required TResult Function(PgrAddressModel addressModel) saveAddress,
    required TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)
        saveComplaintDetails,
    required TResult Function(String userId) submitComplaint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult? Function(PgrAddressModel addressModel)? saveAddress,
    TResult? Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult? Function(String userId)? submitComplaint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult Function(PgrAddressModel addressModel)? saveAddress,
    TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult Function(String userId)? submitComplaint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            ComplaintsRegistrationSaveComplaintTypeEvent value)
        saveComplaintType,
    required TResult Function(ComplaintsRegistrationSaveAddressEvent value)
        saveAddress,
    required TResult Function(
            ComplaintsRegistrationSaveComplaintDetailsEvent value)
        saveComplaintDetails,
    required TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)
        submitComplaint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult? Function(ComplaintsRegistrationSaveAddressEvent value)?
        saveAddress,
    TResult? Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult? Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult Function(ComplaintsRegistrationSaveAddressEvent value)? saveAddress,
    TResult Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintsRegistrationEventCopyWith<$Res> {
  factory $ComplaintsRegistrationEventCopyWith(
          ComplaintsRegistrationEvent value,
          $Res Function(ComplaintsRegistrationEvent) then) =
      _$ComplaintsRegistrationEventCopyWithImpl<$Res,
          ComplaintsRegistrationEvent>;
}

/// @nodoc
class _$ComplaintsRegistrationEventCopyWithImpl<$Res,
        $Val extends ComplaintsRegistrationEvent>
    implements $ComplaintsRegistrationEventCopyWith<$Res> {
  _$ComplaintsRegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWith<
    $Res> {
  factory _$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWith(
          _$ComplaintsRegistrationSaveComplaintTypeEventImpl value,
          $Res Function(_$ComplaintsRegistrationSaveComplaintTypeEventImpl)
              then) =
      __$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String complaintType, String? otherComplaintDescription});
}

/// @nodoc
class __$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationEventCopyWithImpl<$Res,
        _$ComplaintsRegistrationSaveComplaintTypeEventImpl>
    implements
        _$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWith<$Res> {
  __$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWithImpl(
      _$ComplaintsRegistrationSaveComplaintTypeEventImpl _value,
      $Res Function(_$ComplaintsRegistrationSaveComplaintTypeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintType = null,
    Object? otherComplaintDescription = freezed,
  }) {
    return _then(_$ComplaintsRegistrationSaveComplaintTypeEventImpl(
      complaintType: null == complaintType
          ? _value.complaintType
          : complaintType // ignore: cast_nullable_to_non_nullable
              as String,
      otherComplaintDescription: freezed == otherComplaintDescription
          ? _value.otherComplaintDescription
          : otherComplaintDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ComplaintsRegistrationSaveComplaintTypeEventImpl
    implements ComplaintsRegistrationSaveComplaintTypeEvent {
  const _$ComplaintsRegistrationSaveComplaintTypeEventImpl(
      {required this.complaintType, this.otherComplaintDescription});

  @override
  final String complaintType;
  @override
  final String? otherComplaintDescription;

  @override
  String toString() {
    return 'ComplaintsRegistrationEvent.saveComplaintType(complaintType: $complaintType, otherComplaintDescription: $otherComplaintDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationSaveComplaintTypeEventImpl &&
            (identical(other.complaintType, complaintType) ||
                other.complaintType == complaintType) &&
            (identical(other.otherComplaintDescription,
                    otherComplaintDescription) ||
                other.otherComplaintDescription == otherComplaintDescription));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, complaintType, otherComplaintDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWith<
          _$ComplaintsRegistrationSaveComplaintTypeEventImpl>
      get copyWith =>
          __$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWithImpl<
                  _$ComplaintsRegistrationSaveComplaintTypeEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String complaintType, String? otherComplaintDescription)
        saveComplaintType,
    required TResult Function(PgrAddressModel addressModel) saveAddress,
    required TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)
        saveComplaintDetails,
    required TResult Function(String userId) submitComplaint,
  }) {
    return saveComplaintType(complaintType, otherComplaintDescription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult? Function(PgrAddressModel addressModel)? saveAddress,
    TResult? Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult? Function(String userId)? submitComplaint,
  }) {
    return saveComplaintType?.call(complaintType, otherComplaintDescription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult Function(PgrAddressModel addressModel)? saveAddress,
    TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult Function(String userId)? submitComplaint,
    required TResult orElse(),
  }) {
    if (saveComplaintType != null) {
      return saveComplaintType(complaintType, otherComplaintDescription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            ComplaintsRegistrationSaveComplaintTypeEvent value)
        saveComplaintType,
    required TResult Function(ComplaintsRegistrationSaveAddressEvent value)
        saveAddress,
    required TResult Function(
            ComplaintsRegistrationSaveComplaintDetailsEvent value)
        saveComplaintDetails,
    required TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)
        submitComplaint,
  }) {
    return saveComplaintType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult? Function(ComplaintsRegistrationSaveAddressEvent value)?
        saveAddress,
    TResult? Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult? Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
  }) {
    return saveComplaintType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult Function(ComplaintsRegistrationSaveAddressEvent value)? saveAddress,
    TResult Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
    required TResult orElse(),
  }) {
    if (saveComplaintType != null) {
      return saveComplaintType(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationSaveComplaintTypeEvent
    implements ComplaintsRegistrationEvent {
  const factory ComplaintsRegistrationSaveComplaintTypeEvent(
          {required final String complaintType,
          final String? otherComplaintDescription}) =
      _$ComplaintsRegistrationSaveComplaintTypeEventImpl;

  String get complaintType;
  String? get otherComplaintDescription;
  @JsonKey(ignore: true)
  _$$ComplaintsRegistrationSaveComplaintTypeEventImplCopyWith<
          _$ComplaintsRegistrationSaveComplaintTypeEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationSaveAddressEventImplCopyWith<$Res> {
  factory _$$ComplaintsRegistrationSaveAddressEventImplCopyWith(
          _$ComplaintsRegistrationSaveAddressEventImpl value,
          $Res Function(_$ComplaintsRegistrationSaveAddressEventImpl) then) =
      __$$ComplaintsRegistrationSaveAddressEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PgrAddressModel addressModel});
}

/// @nodoc
class __$$ComplaintsRegistrationSaveAddressEventImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationEventCopyWithImpl<$Res,
        _$ComplaintsRegistrationSaveAddressEventImpl>
    implements _$$ComplaintsRegistrationSaveAddressEventImplCopyWith<$Res> {
  __$$ComplaintsRegistrationSaveAddressEventImplCopyWithImpl(
      _$ComplaintsRegistrationSaveAddressEventImpl _value,
      $Res Function(_$ComplaintsRegistrationSaveAddressEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressModel = null,
  }) {
    return _then(_$ComplaintsRegistrationSaveAddressEventImpl(
      addressModel: null == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as PgrAddressModel,
    ));
  }
}

/// @nodoc

class _$ComplaintsRegistrationSaveAddressEventImpl
    implements ComplaintsRegistrationSaveAddressEvent {
  const _$ComplaintsRegistrationSaveAddressEventImpl(
      {required this.addressModel});

  @override
  final PgrAddressModel addressModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationEvent.saveAddress(addressModel: $addressModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationSaveAddressEventImpl &&
            (identical(other.addressModel, addressModel) ||
                other.addressModel == addressModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsRegistrationSaveAddressEventImplCopyWith<
          _$ComplaintsRegistrationSaveAddressEventImpl>
      get copyWith =>
          __$$ComplaintsRegistrationSaveAddressEventImplCopyWithImpl<
              _$ComplaintsRegistrationSaveAddressEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String complaintType, String? otherComplaintDescription)
        saveComplaintType,
    required TResult Function(PgrAddressModel addressModel) saveAddress,
    required TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)
        saveComplaintDetails,
    required TResult Function(String userId) submitComplaint,
  }) {
    return saveAddress(addressModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult? Function(PgrAddressModel addressModel)? saveAddress,
    TResult? Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult? Function(String userId)? submitComplaint,
  }) {
    return saveAddress?.call(addressModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult Function(PgrAddressModel addressModel)? saveAddress,
    TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult Function(String userId)? submitComplaint,
    required TResult orElse(),
  }) {
    if (saveAddress != null) {
      return saveAddress(addressModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            ComplaintsRegistrationSaveComplaintTypeEvent value)
        saveComplaintType,
    required TResult Function(ComplaintsRegistrationSaveAddressEvent value)
        saveAddress,
    required TResult Function(
            ComplaintsRegistrationSaveComplaintDetailsEvent value)
        saveComplaintDetails,
    required TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)
        submitComplaint,
  }) {
    return saveAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult? Function(ComplaintsRegistrationSaveAddressEvent value)?
        saveAddress,
    TResult? Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult? Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
  }) {
    return saveAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult Function(ComplaintsRegistrationSaveAddressEvent value)? saveAddress,
    TResult Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
    required TResult orElse(),
  }) {
    if (saveAddress != null) {
      return saveAddress(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationSaveAddressEvent
    implements ComplaintsRegistrationEvent {
  const factory ComplaintsRegistrationSaveAddressEvent(
          {required final PgrAddressModel addressModel}) =
      _$ComplaintsRegistrationSaveAddressEventImpl;

  PgrAddressModel get addressModel;
  @JsonKey(ignore: true)
  _$$ComplaintsRegistrationSaveAddressEventImplCopyWith<
          _$ComplaintsRegistrationSaveAddressEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWith<
    $Res> {
  factory _$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWith(
          _$ComplaintsRegistrationSaveComplaintDetailsEventImpl value,
          $Res Function(_$ComplaintsRegistrationSaveComplaintDetailsEventImpl)
              then) =
      __$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ComplaintsDetailsModel complaintsDetailsModel,
      BoundaryModel boundaryModel});

  $ComplaintsDetailsModelCopyWith<$Res> get complaintsDetailsModel;
}

/// @nodoc
class __$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationEventCopyWithImpl<$Res,
        _$ComplaintsRegistrationSaveComplaintDetailsEventImpl>
    implements
        _$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWith<$Res> {
  __$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWithImpl(
      _$ComplaintsRegistrationSaveComplaintDetailsEventImpl _value,
      $Res Function(_$ComplaintsRegistrationSaveComplaintDetailsEventImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintsDetailsModel = null,
    Object? boundaryModel = null,
  }) {
    return _then(_$ComplaintsRegistrationSaveComplaintDetailsEventImpl(
      complaintsDetailsModel: null == complaintsDetailsModel
          ? _value.complaintsDetailsModel
          : complaintsDetailsModel // ignore: cast_nullable_to_non_nullable
              as ComplaintsDetailsModel,
      boundaryModel: null == boundaryModel
          ? _value.boundaryModel
          : boundaryModel // ignore: cast_nullable_to_non_nullable
              as BoundaryModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComplaintsDetailsModelCopyWith<$Res> get complaintsDetailsModel {
    return $ComplaintsDetailsModelCopyWith<$Res>(_value.complaintsDetailsModel,
        (value) {
      return _then(_value.copyWith(complaintsDetailsModel: value));
    });
  }
}

/// @nodoc

class _$ComplaintsRegistrationSaveComplaintDetailsEventImpl
    implements ComplaintsRegistrationSaveComplaintDetailsEvent {
  const _$ComplaintsRegistrationSaveComplaintDetailsEventImpl(
      {required this.complaintsDetailsModel, required this.boundaryModel});

  @override
  final ComplaintsDetailsModel complaintsDetailsModel;
  @override
  final BoundaryModel boundaryModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationEvent.saveComplaintDetails(complaintsDetailsModel: $complaintsDetailsModel, boundaryModel: $boundaryModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationSaveComplaintDetailsEventImpl &&
            (identical(other.complaintsDetailsModel, complaintsDetailsModel) ||
                other.complaintsDetailsModel == complaintsDetailsModel) &&
            (identical(other.boundaryModel, boundaryModel) ||
                other.boundaryModel == boundaryModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, complaintsDetailsModel, boundaryModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWith<
          _$ComplaintsRegistrationSaveComplaintDetailsEventImpl>
      get copyWith =>
          __$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWithImpl<
                  _$ComplaintsRegistrationSaveComplaintDetailsEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String complaintType, String? otherComplaintDescription)
        saveComplaintType,
    required TResult Function(PgrAddressModel addressModel) saveAddress,
    required TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)
        saveComplaintDetails,
    required TResult Function(String userId) submitComplaint,
  }) {
    return saveComplaintDetails(complaintsDetailsModel, boundaryModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult? Function(PgrAddressModel addressModel)? saveAddress,
    TResult? Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult? Function(String userId)? submitComplaint,
  }) {
    return saveComplaintDetails?.call(complaintsDetailsModel, boundaryModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult Function(PgrAddressModel addressModel)? saveAddress,
    TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult Function(String userId)? submitComplaint,
    required TResult orElse(),
  }) {
    if (saveComplaintDetails != null) {
      return saveComplaintDetails(complaintsDetailsModel, boundaryModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            ComplaintsRegistrationSaveComplaintTypeEvent value)
        saveComplaintType,
    required TResult Function(ComplaintsRegistrationSaveAddressEvent value)
        saveAddress,
    required TResult Function(
            ComplaintsRegistrationSaveComplaintDetailsEvent value)
        saveComplaintDetails,
    required TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)
        submitComplaint,
  }) {
    return saveComplaintDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult? Function(ComplaintsRegistrationSaveAddressEvent value)?
        saveAddress,
    TResult? Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult? Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
  }) {
    return saveComplaintDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult Function(ComplaintsRegistrationSaveAddressEvent value)? saveAddress,
    TResult Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
    required TResult orElse(),
  }) {
    if (saveComplaintDetails != null) {
      return saveComplaintDetails(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationSaveComplaintDetailsEvent
    implements ComplaintsRegistrationEvent {
  const factory ComplaintsRegistrationSaveComplaintDetailsEvent(
          {required final ComplaintsDetailsModel complaintsDetailsModel,
          required final BoundaryModel boundaryModel}) =
      _$ComplaintsRegistrationSaveComplaintDetailsEventImpl;

  ComplaintsDetailsModel get complaintsDetailsModel;
  BoundaryModel get boundaryModel;
  @JsonKey(ignore: true)
  _$$ComplaintsRegistrationSaveComplaintDetailsEventImplCopyWith<
          _$ComplaintsRegistrationSaveComplaintDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationSubmitComplaintEventImplCopyWith<$Res> {
  factory _$$ComplaintsRegistrationSubmitComplaintEventImplCopyWith(
          _$ComplaintsRegistrationSubmitComplaintEventImpl value,
          $Res Function(_$ComplaintsRegistrationSubmitComplaintEventImpl)
              then) =
      __$$ComplaintsRegistrationSubmitComplaintEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$ComplaintsRegistrationSubmitComplaintEventImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationEventCopyWithImpl<$Res,
        _$ComplaintsRegistrationSubmitComplaintEventImpl>
    implements _$$ComplaintsRegistrationSubmitComplaintEventImplCopyWith<$Res> {
  __$$ComplaintsRegistrationSubmitComplaintEventImplCopyWithImpl(
      _$ComplaintsRegistrationSubmitComplaintEventImpl _value,
      $Res Function(_$ComplaintsRegistrationSubmitComplaintEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$ComplaintsRegistrationSubmitComplaintEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ComplaintsRegistrationSubmitComplaintEventImpl
    implements ComplaintsRegistrationSubmitComplaintEvent {
  const _$ComplaintsRegistrationSubmitComplaintEventImpl(
      {required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ComplaintsRegistrationEvent.submitComplaint(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationSubmitComplaintEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsRegistrationSubmitComplaintEventImplCopyWith<
          _$ComplaintsRegistrationSubmitComplaintEventImpl>
      get copyWith =>
          __$$ComplaintsRegistrationSubmitComplaintEventImplCopyWithImpl<
                  _$ComplaintsRegistrationSubmitComplaintEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String complaintType, String? otherComplaintDescription)
        saveComplaintType,
    required TResult Function(PgrAddressModel addressModel) saveAddress,
    required TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)
        saveComplaintDetails,
    required TResult Function(String userId) submitComplaint,
  }) {
    return submitComplaint(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult? Function(PgrAddressModel addressModel)? saveAddress,
    TResult? Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult? Function(String userId)? submitComplaint,
  }) {
    return submitComplaint?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String complaintType, String? otherComplaintDescription)?
        saveComplaintType,
    TResult Function(PgrAddressModel addressModel)? saveAddress,
    TResult Function(ComplaintsDetailsModel complaintsDetailsModel,
            BoundaryModel boundaryModel)?
        saveComplaintDetails,
    TResult Function(String userId)? submitComplaint,
    required TResult orElse(),
  }) {
    if (submitComplaint != null) {
      return submitComplaint(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            ComplaintsRegistrationSaveComplaintTypeEvent value)
        saveComplaintType,
    required TResult Function(ComplaintsRegistrationSaveAddressEvent value)
        saveAddress,
    required TResult Function(
            ComplaintsRegistrationSaveComplaintDetailsEvent value)
        saveComplaintDetails,
    required TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)
        submitComplaint,
  }) {
    return submitComplaint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult? Function(ComplaintsRegistrationSaveAddressEvent value)?
        saveAddress,
    TResult? Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult? Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
  }) {
    return submitComplaint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationSaveComplaintTypeEvent value)?
        saveComplaintType,
    TResult Function(ComplaintsRegistrationSaveAddressEvent value)? saveAddress,
    TResult Function(ComplaintsRegistrationSaveComplaintDetailsEvent value)?
        saveComplaintDetails,
    TResult Function(ComplaintsRegistrationSubmitComplaintEvent value)?
        submitComplaint,
    required TResult orElse(),
  }) {
    if (submitComplaint != null) {
      return submitComplaint(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationSubmitComplaintEvent
    implements ComplaintsRegistrationEvent {
  const factory ComplaintsRegistrationSubmitComplaintEvent(
          {required final String userId}) =
      _$ComplaintsRegistrationSubmitComplaintEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$ComplaintsRegistrationSubmitComplaintEventImplCopyWith<
          _$ComplaintsRegistrationSubmitComplaintEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComplaintsRegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)
        create,
    required TResult Function(
            String complaintType,
            PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)
        view,
    required TResult Function() persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult? Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult? Function()? persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult Function()? persisted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ComplaintsRegistrationCreateState value) create,
    required TResult Function(ComplaintsRegistrationViewState value) view,
    required TResult Function(ComplaintsRegistrationPersistedState value)
        persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationCreateState value)? create,
    TResult? Function(ComplaintsRegistrationViewState value)? view,
    TResult? Function(ComplaintsRegistrationPersistedState value)? persisted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationCreateState value)? create,
    TResult Function(ComplaintsRegistrationViewState value)? view,
    TResult Function(ComplaintsRegistrationPersistedState value)? persisted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintsRegistrationStateCopyWith<$Res> {
  factory $ComplaintsRegistrationStateCopyWith(
          ComplaintsRegistrationState value,
          $Res Function(ComplaintsRegistrationState) then) =
      _$ComplaintsRegistrationStateCopyWithImpl<$Res,
          ComplaintsRegistrationState>;
}

/// @nodoc
class _$ComplaintsRegistrationStateCopyWithImpl<$Res,
        $Val extends ComplaintsRegistrationState>
    implements $ComplaintsRegistrationStateCopyWith<$Res> {
  _$ComplaintsRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationCreateStateImplCopyWith<$Res> {
  factory _$$ComplaintsRegistrationCreateStateImplCopyWith(
          _$ComplaintsRegistrationCreateStateImpl value,
          $Res Function(_$ComplaintsRegistrationCreateStateImpl) then) =
      __$$ComplaintsRegistrationCreateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool loading,
      String? complaintType,
      String? otherComplaintTypeDescription,
      PgrAddressModel? addressModel,
      ComplaintsDetailsModel? complaintsDetailsModel});

  $ComplaintsDetailsModelCopyWith<$Res>? get complaintsDetailsModel;
}

/// @nodoc
class __$$ComplaintsRegistrationCreateStateImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationStateCopyWithImpl<$Res,
        _$ComplaintsRegistrationCreateStateImpl>
    implements _$$ComplaintsRegistrationCreateStateImplCopyWith<$Res> {
  __$$ComplaintsRegistrationCreateStateImplCopyWithImpl(
      _$ComplaintsRegistrationCreateStateImpl _value,
      $Res Function(_$ComplaintsRegistrationCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? complaintType = freezed,
    Object? otherComplaintTypeDescription = freezed,
    Object? addressModel = freezed,
    Object? complaintsDetailsModel = freezed,
  }) {
    return _then(_$ComplaintsRegistrationCreateStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      complaintType: freezed == complaintType
          ? _value.complaintType
          : complaintType // ignore: cast_nullable_to_non_nullable
              as String?,
      otherComplaintTypeDescription: freezed == otherComplaintTypeDescription
          ? _value.otherComplaintTypeDescription
          : otherComplaintTypeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      addressModel: freezed == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as PgrAddressModel?,
      complaintsDetailsModel: freezed == complaintsDetailsModel
          ? _value.complaintsDetailsModel
          : complaintsDetailsModel // ignore: cast_nullable_to_non_nullable
              as ComplaintsDetailsModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComplaintsDetailsModelCopyWith<$Res>? get complaintsDetailsModel {
    if (_value.complaintsDetailsModel == null) {
      return null;
    }

    return $ComplaintsDetailsModelCopyWith<$Res>(_value.complaintsDetailsModel!,
        (value) {
      return _then(_value.copyWith(complaintsDetailsModel: value));
    });
  }
}

/// @nodoc

class _$ComplaintsRegistrationCreateStateImpl
    implements ComplaintsRegistrationCreateState {
  const _$ComplaintsRegistrationCreateStateImpl(
      {this.loading = false,
      this.complaintType,
      this.otherComplaintTypeDescription,
      this.addressModel,
      this.complaintsDetailsModel});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? complaintType;
  @override
  final String? otherComplaintTypeDescription;
  @override
  final PgrAddressModel? addressModel;
  @override
  final ComplaintsDetailsModel? complaintsDetailsModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationState.create(loading: $loading, complaintType: $complaintType, otherComplaintTypeDescription: $otherComplaintTypeDescription, addressModel: $addressModel, complaintsDetailsModel: $complaintsDetailsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationCreateStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.complaintType, complaintType) ||
                other.complaintType == complaintType) &&
            (identical(other.otherComplaintTypeDescription,
                    otherComplaintTypeDescription) ||
                other.otherComplaintTypeDescription ==
                    otherComplaintTypeDescription) &&
            (identical(other.addressModel, addressModel) ||
                other.addressModel == addressModel) &&
            (identical(other.complaintsDetailsModel, complaintsDetailsModel) ||
                other.complaintsDetailsModel == complaintsDetailsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, complaintType,
      otherComplaintTypeDescription, addressModel, complaintsDetailsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsRegistrationCreateStateImplCopyWith<
          _$ComplaintsRegistrationCreateStateImpl>
      get copyWith => __$$ComplaintsRegistrationCreateStateImplCopyWithImpl<
          _$ComplaintsRegistrationCreateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)
        create,
    required TResult Function(
            String complaintType,
            PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)
        view,
    required TResult Function() persisted,
  }) {
    return create(loading, complaintType, otherComplaintTypeDescription,
        addressModel, complaintsDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult? Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult? Function()? persisted,
  }) {
    return create?.call(loading, complaintType, otherComplaintTypeDescription,
        addressModel, complaintsDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult Function()? persisted,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(loading, complaintType, otherComplaintTypeDescription,
          addressModel, complaintsDetailsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ComplaintsRegistrationCreateState value) create,
    required TResult Function(ComplaintsRegistrationViewState value) view,
    required TResult Function(ComplaintsRegistrationPersistedState value)
        persisted,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationCreateState value)? create,
    TResult? Function(ComplaintsRegistrationViewState value)? view,
    TResult? Function(ComplaintsRegistrationPersistedState value)? persisted,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationCreateState value)? create,
    TResult Function(ComplaintsRegistrationViewState value)? view,
    TResult Function(ComplaintsRegistrationPersistedState value)? persisted,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationCreateState
    implements ComplaintsRegistrationState {
  const factory ComplaintsRegistrationCreateState(
          {final bool loading,
          final String? complaintType,
          final String? otherComplaintTypeDescription,
          final PgrAddressModel? addressModel,
          final ComplaintsDetailsModel? complaintsDetailsModel}) =
      _$ComplaintsRegistrationCreateStateImpl;

  bool get loading;
  String? get complaintType;
  String? get otherComplaintTypeDescription;
  PgrAddressModel? get addressModel;
  ComplaintsDetailsModel? get complaintsDetailsModel;
  @JsonKey(ignore: true)
  _$$ComplaintsRegistrationCreateStateImplCopyWith<
          _$ComplaintsRegistrationCreateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationViewStateImplCopyWith<$Res> {
  factory _$$ComplaintsRegistrationViewStateImplCopyWith(
          _$ComplaintsRegistrationViewStateImpl value,
          $Res Function(_$ComplaintsRegistrationViewStateImpl) then) =
      __$$ComplaintsRegistrationViewStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String complaintType,
      PgrAddressModel addressModel,
      ComplaintsDetailsModel complaintsDetailsModel});

  $ComplaintsDetailsModelCopyWith<$Res> get complaintsDetailsModel;
}

/// @nodoc
class __$$ComplaintsRegistrationViewStateImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationStateCopyWithImpl<$Res,
        _$ComplaintsRegistrationViewStateImpl>
    implements _$$ComplaintsRegistrationViewStateImplCopyWith<$Res> {
  __$$ComplaintsRegistrationViewStateImplCopyWithImpl(
      _$ComplaintsRegistrationViewStateImpl _value,
      $Res Function(_$ComplaintsRegistrationViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintType = null,
    Object? addressModel = null,
    Object? complaintsDetailsModel = null,
  }) {
    return _then(_$ComplaintsRegistrationViewStateImpl(
      complaintType: null == complaintType
          ? _value.complaintType
          : complaintType // ignore: cast_nullable_to_non_nullable
              as String,
      addressModel: null == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as PgrAddressModel,
      complaintsDetailsModel: null == complaintsDetailsModel
          ? _value.complaintsDetailsModel
          : complaintsDetailsModel // ignore: cast_nullable_to_non_nullable
              as ComplaintsDetailsModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComplaintsDetailsModelCopyWith<$Res> get complaintsDetailsModel {
    return $ComplaintsDetailsModelCopyWith<$Res>(_value.complaintsDetailsModel,
        (value) {
      return _then(_value.copyWith(complaintsDetailsModel: value));
    });
  }
}

/// @nodoc

class _$ComplaintsRegistrationViewStateImpl
    implements ComplaintsRegistrationViewState {
  const _$ComplaintsRegistrationViewStateImpl(
      {required this.complaintType,
      required this.addressModel,
      required this.complaintsDetailsModel});

  @override
  final String complaintType;
  @override
  final PgrAddressModel addressModel;
  @override
  final ComplaintsDetailsModel complaintsDetailsModel;

  @override
  String toString() {
    return 'ComplaintsRegistrationState.view(complaintType: $complaintType, addressModel: $addressModel, complaintsDetailsModel: $complaintsDetailsModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationViewStateImpl &&
            (identical(other.complaintType, complaintType) ||
                other.complaintType == complaintType) &&
            (identical(other.addressModel, addressModel) ||
                other.addressModel == addressModel) &&
            (identical(other.complaintsDetailsModel, complaintsDetailsModel) ||
                other.complaintsDetailsModel == complaintsDetailsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, complaintType, addressModel, complaintsDetailsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintsRegistrationViewStateImplCopyWith<
          _$ComplaintsRegistrationViewStateImpl>
      get copyWith => __$$ComplaintsRegistrationViewStateImplCopyWithImpl<
          _$ComplaintsRegistrationViewStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)
        create,
    required TResult Function(
            String complaintType,
            PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)
        view,
    required TResult Function() persisted,
  }) {
    return view(complaintType, addressModel, complaintsDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult? Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult? Function()? persisted,
  }) {
    return view?.call(complaintType, addressModel, complaintsDetailsModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult Function()? persisted,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(complaintType, addressModel, complaintsDetailsModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ComplaintsRegistrationCreateState value) create,
    required TResult Function(ComplaintsRegistrationViewState value) view,
    required TResult Function(ComplaintsRegistrationPersistedState value)
        persisted,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationCreateState value)? create,
    TResult? Function(ComplaintsRegistrationViewState value)? view,
    TResult? Function(ComplaintsRegistrationPersistedState value)? persisted,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationCreateState value)? create,
    TResult Function(ComplaintsRegistrationViewState value)? view,
    TResult Function(ComplaintsRegistrationPersistedState value)? persisted,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationViewState
    implements ComplaintsRegistrationState {
  const factory ComplaintsRegistrationViewState(
          {required final String complaintType,
          required final PgrAddressModel addressModel,
          required final ComplaintsDetailsModel complaintsDetailsModel}) =
      _$ComplaintsRegistrationViewStateImpl;

  String get complaintType;
  PgrAddressModel get addressModel;
  ComplaintsDetailsModel get complaintsDetailsModel;
  @JsonKey(ignore: true)
  _$$ComplaintsRegistrationViewStateImplCopyWith<
          _$ComplaintsRegistrationViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplaintsRegistrationPersistedStateImplCopyWith<$Res> {
  factory _$$ComplaintsRegistrationPersistedStateImplCopyWith(
          _$ComplaintsRegistrationPersistedStateImpl value,
          $Res Function(_$ComplaintsRegistrationPersistedStateImpl) then) =
      __$$ComplaintsRegistrationPersistedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ComplaintsRegistrationPersistedStateImplCopyWithImpl<$Res>
    extends _$ComplaintsRegistrationStateCopyWithImpl<$Res,
        _$ComplaintsRegistrationPersistedStateImpl>
    implements _$$ComplaintsRegistrationPersistedStateImplCopyWith<$Res> {
  __$$ComplaintsRegistrationPersistedStateImplCopyWithImpl(
      _$ComplaintsRegistrationPersistedStateImpl _value,
      $Res Function(_$ComplaintsRegistrationPersistedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ComplaintsRegistrationPersistedStateImpl
    implements ComplaintsRegistrationPersistedState {
  const _$ComplaintsRegistrationPersistedStateImpl();

  @override
  String toString() {
    return 'ComplaintsRegistrationState.persisted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintsRegistrationPersistedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)
        create,
    required TResult Function(
            String complaintType,
            PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)
        view,
    required TResult Function() persisted,
  }) {
    return persisted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult? Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult? Function()? persisted,
  }) {
    return persisted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool loading,
            String? complaintType,
            String? otherComplaintTypeDescription,
            PgrAddressModel? addressModel,
            ComplaintsDetailsModel? complaintsDetailsModel)?
        create,
    TResult Function(String complaintType, PgrAddressModel addressModel,
            ComplaintsDetailsModel complaintsDetailsModel)?
        view,
    TResult Function()? persisted,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ComplaintsRegistrationCreateState value) create,
    required TResult Function(ComplaintsRegistrationViewState value) view,
    required TResult Function(ComplaintsRegistrationPersistedState value)
        persisted,
  }) {
    return persisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ComplaintsRegistrationCreateState value)? create,
    TResult? Function(ComplaintsRegistrationViewState value)? view,
    TResult? Function(ComplaintsRegistrationPersistedState value)? persisted,
  }) {
    return persisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ComplaintsRegistrationCreateState value)? create,
    TResult Function(ComplaintsRegistrationViewState value)? view,
    TResult Function(ComplaintsRegistrationPersistedState value)? persisted,
    required TResult orElse(),
  }) {
    if (persisted != null) {
      return persisted(this);
    }
    return orElse();
  }
}

abstract class ComplaintsRegistrationPersistedState
    implements ComplaintsRegistrationState {
  const factory ComplaintsRegistrationPersistedState() =
      _$ComplaintsRegistrationPersistedStateImpl;
}

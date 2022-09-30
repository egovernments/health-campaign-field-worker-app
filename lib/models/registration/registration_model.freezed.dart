// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HouseholdRegistrationModel _$HouseholdRegistrationModelFromJson(
    Map<String, dynamic> json) {
  return _HouseholdRegistrationModel.fromJson(json);
}

/// @nodoc
mixin _$HouseholdRegistrationModel {
  String? get additionalFields => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  String get administrativeUnit => throw _privateConstructorUsedError;
  ApiMode get apiMode => throw _privateConstructorUsedError;
  AuditDetailsModel? get auditDetails => throw _privateConstructorUsedError;
  String get campaignId => throw _privateConstructorUsedError;
  String get clientReferenceId => throw _privateConstructorUsedError;

  /// [dateOfRegistration] in millisecondsSinceEpoch
  int get dateOfRegistration => throw _privateConstructorUsedError;
  String? get householdId => throw _privateConstructorUsedError;
  List<IndividualModel> get individuals => throw _privateConstructorUsedError;
  LatLngModel? get location => throw _privateConstructorUsedError;
  int get numberOfIndividuals => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  SyncObjectModelType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseholdRegistrationModelCopyWith<HouseholdRegistrationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdRegistrationModelCopyWith<$Res> {
  factory $HouseholdRegistrationModelCopyWith(HouseholdRegistrationModel value,
          $Res Function(HouseholdRegistrationModel) then) =
      _$HouseholdRegistrationModelCopyWithImpl<$Res>;
  $Res call(
      {String? additionalFields,
      AddressModel address,
      String administrativeUnit,
      ApiMode apiMode,
      AuditDetailsModel? auditDetails,
      String campaignId,
      String clientReferenceId,
      int dateOfRegistration,
      String? householdId,
      List<IndividualModel> individuals,
      LatLngModel? location,
      int numberOfIndividuals,
      String tenantId,
      SyncObjectModelType type});

  $AddressModelCopyWith<$Res> get address;
  $AuditDetailsModelCopyWith<$Res>? get auditDetails;
  $LatLngModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$HouseholdRegistrationModelCopyWithImpl<$Res>
    implements $HouseholdRegistrationModelCopyWith<$Res> {
  _$HouseholdRegistrationModelCopyWithImpl(this._value, this._then);

  final HouseholdRegistrationModel _value;
  // ignore: unused_field
  final $Res Function(HouseholdRegistrationModel) _then;

  @override
  $Res call({
    Object? additionalFields = freezed,
    Object? address = freezed,
    Object? administrativeUnit = freezed,
    Object? apiMode = freezed,
    Object? auditDetails = freezed,
    Object? campaignId = freezed,
    Object? clientReferenceId = freezed,
    Object? dateOfRegistration = freezed,
    Object? householdId = freezed,
    Object? individuals = freezed,
    Object? location = freezed,
    Object? numberOfIndividuals = freezed,
    Object? tenantId = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      administrativeUnit: administrativeUnit == freezed
          ? _value.administrativeUnit
          : administrativeUnit // ignore: cast_nullable_to_non_nullable
              as String,
      apiMode: apiMode == freezed
          ? _value.apiMode
          : apiMode // ignore: cast_nullable_to_non_nullable
              as ApiMode,
      auditDetails: auditDetails == freezed
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetailsModel?,
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      clientReferenceId: clientReferenceId == freezed
          ? _value.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfRegistration: dateOfRegistration == freezed
          ? _value.dateOfRegistration
          : dateOfRegistration // ignore: cast_nullable_to_non_nullable
              as int,
      householdId: householdId == freezed
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String?,
      individuals: individuals == freezed
          ? _value.individuals
          : individuals // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLngModel?,
      numberOfIndividuals: numberOfIndividuals == freezed
          ? _value.numberOfIndividuals
          : numberOfIndividuals // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SyncObjectModelType,
    ));
  }

  @override
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }

  @override
  $AuditDetailsModelCopyWith<$Res>? get auditDetails {
    if (_value.auditDetails == null) {
      return null;
    }

    return $AuditDetailsModelCopyWith<$Res>(_value.auditDetails!, (value) {
      return _then(_value.copyWith(auditDetails: value));
    });
  }

  @override
  $LatLngModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LatLngModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_HouseholdRegistrationModelCopyWith<$Res>
    implements $HouseholdRegistrationModelCopyWith<$Res> {
  factory _$$_HouseholdRegistrationModelCopyWith(
          _$_HouseholdRegistrationModel value,
          $Res Function(_$_HouseholdRegistrationModel) then) =
      __$$_HouseholdRegistrationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? additionalFields,
      AddressModel address,
      String administrativeUnit,
      ApiMode apiMode,
      AuditDetailsModel? auditDetails,
      String campaignId,
      String clientReferenceId,
      int dateOfRegistration,
      String? householdId,
      List<IndividualModel> individuals,
      LatLngModel? location,
      int numberOfIndividuals,
      String tenantId,
      SyncObjectModelType type});

  @override
  $AddressModelCopyWith<$Res> get address;
  @override
  $AuditDetailsModelCopyWith<$Res>? get auditDetails;
  @override
  $LatLngModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$_HouseholdRegistrationModelCopyWithImpl<$Res>
    extends _$HouseholdRegistrationModelCopyWithImpl<$Res>
    implements _$$_HouseholdRegistrationModelCopyWith<$Res> {
  __$$_HouseholdRegistrationModelCopyWithImpl(
      _$_HouseholdRegistrationModel _value,
      $Res Function(_$_HouseholdRegistrationModel) _then)
      : super(_value, (v) => _then(v as _$_HouseholdRegistrationModel));

  @override
  _$_HouseholdRegistrationModel get _value =>
      super._value as _$_HouseholdRegistrationModel;

  @override
  $Res call({
    Object? additionalFields = freezed,
    Object? address = freezed,
    Object? administrativeUnit = freezed,
    Object? apiMode = freezed,
    Object? auditDetails = freezed,
    Object? campaignId = freezed,
    Object? clientReferenceId = freezed,
    Object? dateOfRegistration = freezed,
    Object? householdId = freezed,
    Object? individuals = freezed,
    Object? location = freezed,
    Object? numberOfIndividuals = freezed,
    Object? tenantId = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_HouseholdRegistrationModel(
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      administrativeUnit: administrativeUnit == freezed
          ? _value.administrativeUnit
          : administrativeUnit // ignore: cast_nullable_to_non_nullable
              as String,
      apiMode: apiMode == freezed
          ? _value.apiMode
          : apiMode // ignore: cast_nullable_to_non_nullable
              as ApiMode,
      auditDetails: auditDetails == freezed
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetailsModel?,
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      clientReferenceId: clientReferenceId == freezed
          ? _value.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfRegistration: dateOfRegistration == freezed
          ? _value.dateOfRegistration
          : dateOfRegistration // ignore: cast_nullable_to_non_nullable
              as int,
      householdId: householdId == freezed
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String?,
      individuals: individuals == freezed
          ? _value._individuals
          : individuals // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLngModel?,
      numberOfIndividuals: numberOfIndividuals == freezed
          ? _value.numberOfIndividuals
          : numberOfIndividuals // ignore: cast_nullable_to_non_nullable
              as int,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SyncObjectModelType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HouseholdRegistrationModel implements _HouseholdRegistrationModel {
  const _$_HouseholdRegistrationModel(
      {this.additionalFields,
      required this.address,
      required this.administrativeUnit,
      required this.apiMode,
      this.auditDetails,
      required this.campaignId,
      required this.clientReferenceId,
      required this.dateOfRegistration,
      this.householdId,
      required final List<IndividualModel> individuals,
      this.location,
      required this.numberOfIndividuals,
      required this.tenantId,
      required this.type})
      : _individuals = individuals;

  factory _$_HouseholdRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$$_HouseholdRegistrationModelFromJson(json);

  @override
  final String? additionalFields;
  @override
  final AddressModel address;
  @override
  final String administrativeUnit;
  @override
  final ApiMode apiMode;
  @override
  final AuditDetailsModel? auditDetails;
  @override
  final String campaignId;
  @override
  final String clientReferenceId;

  /// [dateOfRegistration] in millisecondsSinceEpoch
  @override
  final int dateOfRegistration;
  @override
  final String? householdId;
  final List<IndividualModel> _individuals;
  @override
  List<IndividualModel> get individuals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_individuals);
  }

  @override
  final LatLngModel? location;
  @override
  final int numberOfIndividuals;
  @override
  final String tenantId;
  @override
  final SyncObjectModelType type;

  @override
  String toString() {
    return 'HouseholdRegistrationModel(additionalFields: $additionalFields, address: $address, administrativeUnit: $administrativeUnit, apiMode: $apiMode, auditDetails: $auditDetails, campaignId: $campaignId, clientReferenceId: $clientReferenceId, dateOfRegistration: $dateOfRegistration, householdId: $householdId, individuals: $individuals, location: $location, numberOfIndividuals: $numberOfIndividuals, tenantId: $tenantId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseholdRegistrationModel &&
            const DeepCollectionEquality()
                .equals(other.additionalFields, additionalFields) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.administrativeUnit, administrativeUnit) &&
            const DeepCollectionEquality().equals(other.apiMode, apiMode) &&
            const DeepCollectionEquality()
                .equals(other.auditDetails, auditDetails) &&
            const DeepCollectionEquality()
                .equals(other.campaignId, campaignId) &&
            const DeepCollectionEquality()
                .equals(other.clientReferenceId, clientReferenceId) &&
            const DeepCollectionEquality()
                .equals(other.dateOfRegistration, dateOfRegistration) &&
            const DeepCollectionEquality()
                .equals(other.householdId, householdId) &&
            const DeepCollectionEquality()
                .equals(other._individuals, _individuals) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.numberOfIndividuals, numberOfIndividuals) &&
            const DeepCollectionEquality().equals(other.tenantId, tenantId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(additionalFields),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(administrativeUnit),
      const DeepCollectionEquality().hash(apiMode),
      const DeepCollectionEquality().hash(auditDetails),
      const DeepCollectionEquality().hash(campaignId),
      const DeepCollectionEquality().hash(clientReferenceId),
      const DeepCollectionEquality().hash(dateOfRegistration),
      const DeepCollectionEquality().hash(householdId),
      const DeepCollectionEquality().hash(_individuals),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(numberOfIndividuals),
      const DeepCollectionEquality().hash(tenantId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_HouseholdRegistrationModelCopyWith<_$_HouseholdRegistrationModel>
      get copyWith => __$$_HouseholdRegistrationModelCopyWithImpl<
          _$_HouseholdRegistrationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HouseholdRegistrationModelToJson(
      this,
    );
  }
}

abstract class _HouseholdRegistrationModel
    implements HouseholdRegistrationModel, SerializerModel {
  const factory _HouseholdRegistrationModel(
      {final String? additionalFields,
      required final AddressModel address,
      required final String administrativeUnit,
      required final ApiMode apiMode,
      final AuditDetailsModel? auditDetails,
      required final String campaignId,
      required final String clientReferenceId,
      required final int dateOfRegistration,
      final String? householdId,
      required final List<IndividualModel> individuals,
      final LatLngModel? location,
      required final int numberOfIndividuals,
      required final String tenantId,
      required final SyncObjectModelType type}) = _$_HouseholdRegistrationModel;

  factory _HouseholdRegistrationModel.fromJson(Map<String, dynamic> json) =
      _$_HouseholdRegistrationModel.fromJson;

  @override
  String? get additionalFields;
  @override
  AddressModel get address;
  @override
  String get administrativeUnit;
  @override
  ApiMode get apiMode;
  @override
  AuditDetailsModel? get auditDetails;
  @override
  String get campaignId;
  @override
  String get clientReferenceId;
  @override

  /// [dateOfRegistration] in millisecondsSinceEpoch
  int get dateOfRegistration;
  @override
  String? get householdId;
  @override
  List<IndividualModel> get individuals;
  @override
  LatLngModel? get location;
  @override
  int get numberOfIndividuals;
  @override
  String get tenantId;
  @override
  SyncObjectModelType get type;
  @override
  @JsonKey(ignore: true)
  _$$_HouseholdRegistrationModelCopyWith<_$_HouseholdRegistrationModel>
      get copyWith => throw _privateConstructorUsedError;
}

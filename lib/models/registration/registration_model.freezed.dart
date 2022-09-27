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

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) {
  return _RegistrationModel.fromJson(json);
}

/// @nodoc
mixin _$RegistrationModel {
  String get campaignId => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get clientReferenceId => throw _privateConstructorUsedError;
  int get noOfIndividuals => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;

  /// [dateOfRegistration] in millisecondsSinceEpoch
  String get dateOfRegistration => throw _privateConstructorUsedError;
  LatLngModel? get location => throw _privateConstructorUsedError;
  String get administrativeUnit => throw _privateConstructorUsedError;
  List<IndividualModel> get individuals => throw _privateConstructorUsedError;
  AdditionalFieldsModel? get additionalFields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationModelCopyWith<RegistrationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationModelCopyWith<$Res> {
  factory $RegistrationModelCopyWith(
          RegistrationModel value, $Res Function(RegistrationModel) then) =
      _$RegistrationModelCopyWithImpl<$Res>;
  $Res call(
      {String campaignId,
      String tenantId,
      String clientReferenceId,
      int noOfIndividuals,
      AddressModel address,
      String dateOfRegistration,
      LatLngModel? location,
      String administrativeUnit,
      List<IndividualModel> individuals,
      AdditionalFieldsModel? additionalFields});

  $AddressModelCopyWith<$Res> get address;
  $LatLngModelCopyWith<$Res>? get location;
  $AdditionalFieldsModelCopyWith<$Res>? get additionalFields;
}

/// @nodoc
class _$RegistrationModelCopyWithImpl<$Res>
    implements $RegistrationModelCopyWith<$Res> {
  _$RegistrationModelCopyWithImpl(this._value, this._then);

  final RegistrationModel _value;
  // ignore: unused_field
  final $Res Function(RegistrationModel) _then;

  @override
  $Res call({
    Object? campaignId = freezed,
    Object? tenantId = freezed,
    Object? clientReferenceId = freezed,
    Object? noOfIndividuals = freezed,
    Object? address = freezed,
    Object? dateOfRegistration = freezed,
    Object? location = freezed,
    Object? administrativeUnit = freezed,
    Object? individuals = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_value.copyWith(
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      clientReferenceId: clientReferenceId == freezed
          ? _value.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      noOfIndividuals: noOfIndividuals == freezed
          ? _value.noOfIndividuals
          : noOfIndividuals // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      dateOfRegistration: dateOfRegistration == freezed
          ? _value.dateOfRegistration
          : dateOfRegistration // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLngModel?,
      administrativeUnit: administrativeUnit == freezed
          ? _value.administrativeUnit
          : administrativeUnit // ignore: cast_nullable_to_non_nullable
              as String,
      individuals: individuals == freezed
          ? _value.individuals
          : individuals // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as AdditionalFieldsModel?,
    ));
  }

  @override
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
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

  @override
  $AdditionalFieldsModelCopyWith<$Res>? get additionalFields {
    if (_value.additionalFields == null) {
      return null;
    }

    return $AdditionalFieldsModelCopyWith<$Res>(_value.additionalFields!,
        (value) {
      return _then(_value.copyWith(additionalFields: value));
    });
  }
}

/// @nodoc
abstract class _$$_RegistrationModelCopyWith<$Res>
    implements $RegistrationModelCopyWith<$Res> {
  factory _$$_RegistrationModelCopyWith(_$_RegistrationModel value,
          $Res Function(_$_RegistrationModel) then) =
      __$$_RegistrationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String campaignId,
      String tenantId,
      String clientReferenceId,
      int noOfIndividuals,
      AddressModel address,
      String dateOfRegistration,
      LatLngModel? location,
      String administrativeUnit,
      List<IndividualModel> individuals,
      AdditionalFieldsModel? additionalFields});

  @override
  $AddressModelCopyWith<$Res> get address;
  @override
  $LatLngModelCopyWith<$Res>? get location;
  @override
  $AdditionalFieldsModelCopyWith<$Res>? get additionalFields;
}

/// @nodoc
class __$$_RegistrationModelCopyWithImpl<$Res>
    extends _$RegistrationModelCopyWithImpl<$Res>
    implements _$$_RegistrationModelCopyWith<$Res> {
  __$$_RegistrationModelCopyWithImpl(
      _$_RegistrationModel _value, $Res Function(_$_RegistrationModel) _then)
      : super(_value, (v) => _then(v as _$_RegistrationModel));

  @override
  _$_RegistrationModel get _value => super._value as _$_RegistrationModel;

  @override
  $Res call({
    Object? campaignId = freezed,
    Object? tenantId = freezed,
    Object? clientReferenceId = freezed,
    Object? noOfIndividuals = freezed,
    Object? address = freezed,
    Object? dateOfRegistration = freezed,
    Object? location = freezed,
    Object? administrativeUnit = freezed,
    Object? individuals = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_$_RegistrationModel(
      campaignId: campaignId == freezed
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      clientReferenceId: clientReferenceId == freezed
          ? _value.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      noOfIndividuals: noOfIndividuals == freezed
          ? _value.noOfIndividuals
          : noOfIndividuals // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      dateOfRegistration: dateOfRegistration == freezed
          ? _value.dateOfRegistration
          : dateOfRegistration // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLngModel?,
      administrativeUnit: administrativeUnit == freezed
          ? _value.administrativeUnit
          : administrativeUnit // ignore: cast_nullable_to_non_nullable
              as String,
      individuals: individuals == freezed
          ? _value._individuals
          : individuals // ignore: cast_nullable_to_non_nullable
              as List<IndividualModel>,
      additionalFields: additionalFields == freezed
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as AdditionalFieldsModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RegistrationModel implements _RegistrationModel {
  const _$_RegistrationModel(
      {required this.campaignId,
      required this.tenantId,
      required this.clientReferenceId,
      required this.noOfIndividuals,
      required this.address,
      required this.dateOfRegistration,
      this.location,
      required this.administrativeUnit,
      required final List<IndividualModel> individuals,
      this.additionalFields})
      : _individuals = individuals;

  factory _$_RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$$_RegistrationModelFromJson(json);

  @override
  final String campaignId;
  @override
  final String tenantId;
  @override
  final String clientReferenceId;
  @override
  final int noOfIndividuals;
  @override
  final AddressModel address;

  /// [dateOfRegistration] in millisecondsSinceEpoch
  @override
  final String dateOfRegistration;
  @override
  final LatLngModel? location;
  @override
  final String administrativeUnit;
  final List<IndividualModel> _individuals;
  @override
  List<IndividualModel> get individuals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_individuals);
  }

  @override
  final AdditionalFieldsModel? additionalFields;

  @override
  String toString() {
    return 'RegistrationModel(campaignId: $campaignId, tenantId: $tenantId, clientReferenceId: $clientReferenceId, noOfIndividuals: $noOfIndividuals, address: $address, dateOfRegistration: $dateOfRegistration, location: $location, administrativeUnit: $administrativeUnit, individuals: $individuals, additionalFields: $additionalFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationModel &&
            const DeepCollectionEquality()
                .equals(other.campaignId, campaignId) &&
            const DeepCollectionEquality().equals(other.tenantId, tenantId) &&
            const DeepCollectionEquality()
                .equals(other.clientReferenceId, clientReferenceId) &&
            const DeepCollectionEquality()
                .equals(other.noOfIndividuals, noOfIndividuals) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.dateOfRegistration, dateOfRegistration) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.administrativeUnit, administrativeUnit) &&
            const DeepCollectionEquality()
                .equals(other._individuals, _individuals) &&
            const DeepCollectionEquality()
                .equals(other.additionalFields, additionalFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(campaignId),
      const DeepCollectionEquality().hash(tenantId),
      const DeepCollectionEquality().hash(clientReferenceId),
      const DeepCollectionEquality().hash(noOfIndividuals),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(dateOfRegistration),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(administrativeUnit),
      const DeepCollectionEquality().hash(_individuals),
      const DeepCollectionEquality().hash(additionalFields));

  @JsonKey(ignore: true)
  @override
  _$$_RegistrationModelCopyWith<_$_RegistrationModel> get copyWith =>
      __$$_RegistrationModelCopyWithImpl<_$_RegistrationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistrationModelToJson(
      this,
    );
  }
}

abstract class _RegistrationModel implements RegistrationModel {
  const factory _RegistrationModel(
      {required final String campaignId,
      required final String tenantId,
      required final String clientReferenceId,
      required final int noOfIndividuals,
      required final AddressModel address,
      required final String dateOfRegistration,
      final LatLngModel? location,
      required final String administrativeUnit,
      required final List<IndividualModel> individuals,
      final AdditionalFieldsModel? additionalFields}) = _$_RegistrationModel;

  factory _RegistrationModel.fromJson(Map<String, dynamic> json) =
      _$_RegistrationModel.fromJson;

  @override
  String get campaignId;
  @override
  String get tenantId;
  @override
  String get clientReferenceId;
  @override
  int get noOfIndividuals;
  @override
  AddressModel get address;
  @override

  /// [dateOfRegistration] in millisecondsSinceEpoch
  String get dateOfRegistration;
  @override
  LatLngModel? get location;
  @override
  String get administrativeUnit;
  @override
  List<IndividualModel> get individuals;
  @override
  AdditionalFieldsModel? get additionalFields;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationModelCopyWith<_$_RegistrationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

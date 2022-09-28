// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/address/address_model.dart';
import 'package:health_campaigns_flutter/models/individual/individual_model.dart';

import '../dynamic_forms/additional_fields/additional_fields_model.dart';

part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

@freezed
class RegistrationModel with _$RegistrationModel {

  @JsonSerializable(explicitToJson: true)
  const factory RegistrationModel({
    required String campaignId,
    required String tenantId,
    required String clientReferenceId,
    required int noOfIndividuals,
    required AddressModel address,
    /// [dateOfRegistration] in millisecondsSinceEpoch
    required int dateOfRegistration,
    LatLngModel? location,
    required String administrativeUnit,
    required List<IndividualModel> individuals,
    AdditionalFieldsModel? additionalFields,
}) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
}
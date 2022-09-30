// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_campaigns_flutter/models/address/address_model.dart';
import 'package:health_campaigns_flutter/models/audit_model.dart';
import 'package:health_campaigns_flutter/models/individual/individual_model.dart';
import 'package:health_campaigns_flutter/models/serializer_model.dart';
import 'package:health_campaigns_flutter/models/sync/sync_model.dart';


part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

@freezed
class HouseholdRegistrationModel with _$HouseholdRegistrationModel {
  @JsonSerializable(explicitToJson: true)
  @Implements<SerializerModel>()
  const factory HouseholdRegistrationModel({
    String? additionalFields,
    required AddressModel address,
    required String administrativeUnit,
    required ApiMode apiMode,
    AuditDetailsModel? auditDetails,
    required String campaignId,
    required String clientReferenceId,

    /// [dateOfRegistration] in millisecondsSinceEpoch
    required int dateOfRegistration,
    String? householdId,
    required List<IndividualModel> individuals,
    LatLngModel? location,
    required int numberOfIndividuals,
    required String tenantId,
    required SyncObjectModelType type,
  }) = _HouseholdRegistrationModel;

  factory HouseholdRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$HouseholdRegistrationModelFromJson(json);
}

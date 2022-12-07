// // ignore_for_file: invalid_annotation_target
//
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:health_campaigns_flutter/models/address/address_model.dart';
// import 'package:health_campaigns_flutter/models/audit/audit_model.dart';
// import 'package:health_campaigns_flutter/models/individual/individual_model.dart';
// import 'package:health_campaigns_flutter/models/sync/sync_model.dart';
//
// part 'registration_model.freezed.dart';
// part 'registration_model.g.dart';
//
// @freezed
// class CampaignRegistrationModel with _$CampaignRegistrationModel {
//   @JsonSerializable(explicitToJson: true)
//   const factory CampaignRegistrationModel({
//     String? additionalFields,
//     required AddressModel address,
//     required String administrativeUnit,
//     required ApiMode apiMode,
//     AuditDetailsModel? auditDetails,
//     required String campaignId,
//     required String clientReferenceId,
//
//     /// [dateOfRegistration] in millisecondsSinceEpoch
//     required int dateOfRegistration,
//     String? beneficiaryId,
//     String? beneficiaryType,
//     required List<IndividualModel> individuals,
//     // LatLngModel? location,
//     required int numberOfIndividuals,
//     required String tenantId,
//     required SyncObjectModelType type,
//   }) = _CampaignRegistrationModel;
//
//   factory CampaignRegistrationModel.fromJson(Map<String, dynamic> json) =>
//       _$CampaignRegistrationModelFromJson(json);
// }

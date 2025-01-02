// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hf_additional_fields.dart';

class ReferralReconAdditionalFieldsMapper
    extends EnumMapper<ReferralReconAdditionalFields> {
  ReferralReconAdditionalFieldsMapper._();

  static ReferralReconAdditionalFieldsMapper? _instance;
  static ReferralReconAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralReconAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  static ReferralReconAdditionalFields fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ReferralReconAdditionalFields decode(dynamic value) {
    switch (value) {
      case "deliveryStrategy":
        return ReferralReconAdditionalFields.deliveryStrategy;
      case "cycleIndex":
        return ReferralReconAdditionalFields.cycleIndex;
      case "doseIndex":
        return ReferralReconAdditionalFields.doseIndex;
      case "dateOfVerification":
        return ReferralReconAdditionalFields.dateOfVerification;
      case "dateOfAdministration":
        return ReferralReconAdditionalFields.dateOfAdministration;
      case "dateOfDelivery":
        return ReferralReconAdditionalFields.dateOfDelivery;
      case "referralComments":
        return ReferralReconAdditionalFields.referralComments;
      case "cycle":
        return ReferralReconAdditionalFields.cycle;
      case "hfCoordinator":
        return ReferralReconAdditionalFields.hFCoordinator;
      case "referredBy":
        return ReferralReconAdditionalFields.referredBy;
      case "dateOfEvaluation":
        return ReferralReconAdditionalFields.dateOfEvaluation;
      case "nameOfReferral":
        return ReferralReconAdditionalFields.nameOfReferral;
      case "gender":
        return ReferralReconAdditionalFields.gender;
      case "age":
        return ReferralReconAdditionalFields.age;
      case "deliveryComment":
        return ReferralReconAdditionalFields.deliveryComment;
      case "latitude":
        return ReferralReconAdditionalFields.latitude;
      case "longitude":
        return ReferralReconAdditionalFields.longitude;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ReferralReconAdditionalFields self) {
    switch (self) {
      case ReferralReconAdditionalFields.deliveryStrategy:
        return "deliveryStrategy";
      case ReferralReconAdditionalFields.cycleIndex:
        return "cycleIndex";
      case ReferralReconAdditionalFields.doseIndex:
        return "doseIndex";
      case ReferralReconAdditionalFields.dateOfVerification:
        return "dateOfVerification";
      case ReferralReconAdditionalFields.dateOfAdministration:
        return "dateOfAdministration";
      case ReferralReconAdditionalFields.dateOfDelivery:
        return "dateOfDelivery";
      case ReferralReconAdditionalFields.referralComments:
        return "referralComments";
      case ReferralReconAdditionalFields.cycle:
        return "cycle";
      case ReferralReconAdditionalFields.hFCoordinator:
        return "hfCoordinator";
      case ReferralReconAdditionalFields.referredBy:
        return "referredBy";
      case ReferralReconAdditionalFields.dateOfEvaluation:
        return "dateOfEvaluation";
      case ReferralReconAdditionalFields.nameOfReferral:
        return "nameOfReferral";
      case ReferralReconAdditionalFields.gender:
        return "gender";
      case ReferralReconAdditionalFields.age:
        return "age";
      case ReferralReconAdditionalFields.deliveryComment:
        return "deliveryComment";
      case ReferralReconAdditionalFields.latitude:
        return "latitude";
      case ReferralReconAdditionalFields.longitude:
        return "longitude";
    }
  }
}

extension ReferralReconAdditionalFieldsMapperExtension
    on ReferralReconAdditionalFields {
  dynamic toValue() {
    ReferralReconAdditionalFieldsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ReferralReconAdditionalFields>(this);
  }
}

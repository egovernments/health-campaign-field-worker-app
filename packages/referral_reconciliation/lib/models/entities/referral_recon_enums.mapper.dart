// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral_recon_enums.dart';

class ReferralReconEnumsMapper extends EnumMapper<ReferralReconEnums> {
  ReferralReconEnumsMapper._();

  static ReferralReconEnumsMapper? _instance;
  static ReferralReconEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReferralReconEnumsMapper._());
    }
    return _instance!;
  }

  static ReferralReconEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ReferralReconEnums decode(dynamic value) {
    switch (value) {
      case "dateOfVerification":
        return ReferralReconEnums.dateOfVerification;
      case "dateOfAdministration":
        return ReferralReconEnums.dateOfAdministration;
      case "dateOfDelivery":
        return ReferralReconEnums.dateOfDelivery;
      case "referralComments":
        return ReferralReconEnums.referralComments;
      case "cycle":
        return ReferralReconEnums.cycle;
      case "hfCoordinator":
        return ReferralReconEnums.hFCoordinator;
      case "referredBy":
        return ReferralReconEnums.referredBy;
      case "dateOfEvaluation":
        return ReferralReconEnums.dateOfEvaluation;
      case "nameOfReferral":
        return ReferralReconEnums.nameOfReferral;
      case "gender":
        return ReferralReconEnums.gender;
      case "age":
        return ReferralReconEnums.age;
      case "VISITED":
        return ReferralReconEnums.visited;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ReferralReconEnums self) {
    switch (self) {
      case ReferralReconEnums.dateOfVerification:
        return "dateOfVerification";
      case ReferralReconEnums.dateOfAdministration:
        return "dateOfAdministration";
      case ReferralReconEnums.dateOfDelivery:
        return "dateOfDelivery";
      case ReferralReconEnums.referralComments:
        return "referralComments";
      case ReferralReconEnums.cycle:
        return "cycle";
      case ReferralReconEnums.hFCoordinator:
        return "hfCoordinator";
      case ReferralReconEnums.referredBy:
        return "referredBy";
      case ReferralReconEnums.dateOfEvaluation:
        return "dateOfEvaluation";
      case ReferralReconEnums.nameOfReferral:
        return "nameOfReferral";
      case ReferralReconEnums.gender:
        return "gender";
      case ReferralReconEnums.age:
        return "age";
      case ReferralReconEnums.visited:
        return "VISITED";
    }
  }
}

extension ReferralReconEnumsMapperExtension on ReferralReconEnums {
  dynamic toValue() {
    ReferralReconEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ReferralReconEnums>(this);
  }
}

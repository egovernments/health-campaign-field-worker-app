// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'status.dart';

class StatusMapper extends EnumMapper<Status> {
  StatusMapper._();

  static StatusMapper? _instance;
  static StatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StatusMapper._());
    }
    return _instance!;
  }

  static Status fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Status decode(dynamic value) {
    switch (value) {
      case "DELIVERED":
        return Status.delivered;
      case "NOT_ADMINISTERED":
        return Status.notAdministered;
      case "VISITED":
        return Status.visited;
      case "NOT_VISITED":
        return Status.notVisited;
      case "BENEFICIARY_REFUSED":
        return Status.beneficiaryRefused;
      case "BENEFICIARY_INELIGIBLE":
        return Status.beneficiaryInEligible;
      case "BENEFICIARY_REFERRED":
        return Status.beneficiaryReferred;
      case "ADMINISTRATION_SUCCESS":
        return Status.administeredSuccess;
      case "ADMINISTRATION_FAILED":
        return Status.administeredFailed;
      case "IN_COMPLETE":
        return Status.inComplete;
      case "TO_ADMINISTER":
        return Status.toAdminister;
      case "REGISTERED":
        return Status.registered;
      case "NOT_REGISTERED":
        return Status.notRegistered;
      case "CLOSED_HOUSEHOLD":
        return Status.closeHousehold;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Status self) {
    switch (self) {
      case Status.delivered:
        return "DELIVERED";
      case Status.notAdministered:
        return "NOT_ADMINISTERED";
      case Status.visited:
        return "VISITED";
      case Status.notVisited:
        return "NOT_VISITED";
      case Status.beneficiaryRefused:
        return "BENEFICIARY_REFUSED";
      case Status.beneficiaryInEligible:
        return "BENEFICIARY_INELIGIBLE";
      case Status.beneficiaryReferred:
        return "BENEFICIARY_REFERRED";
      case Status.administeredSuccess:
        return "ADMINISTRATION_SUCCESS";
      case Status.administeredFailed:
        return "ADMINISTRATION_FAILED";
      case Status.inComplete:
        return "IN_COMPLETE";
      case Status.toAdminister:
        return "TO_ADMINISTER";
      case Status.registered:
        return "REGISTERED";
      case Status.notRegistered:
        return "NOT_REGISTERED";
      case Status.closeHousehold:
        return "CLOSED_HOUSEHOLD";
    }
  }
}

extension StatusMapperExtension on Status {
  dynamic toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Status>(this);
  }
}

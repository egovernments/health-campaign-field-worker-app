// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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
      case "NOT_DELIVERED":
        return Status.notDelivered;
      case "VISITED":
        return Status.visited;
      case "NOT_VISITED":
        return Status.notVisited;
      case "BENEFICIARY_REFUSED":
        return Status.beneficiaryRefused;
      case "BENEFICIARY_REFERRED":
        return Status.beneficiaryReferred;
      case "ADMINISTERED_SUCCESS":
        return Status.administeredSuccess;
      case "ADMINISTERED_FAILED":
        return Status.administeredFailed;
      case "IN_COMPLETE":
        return Status.inComplete;
      case "TO_ADMINISTER":
        return Status.toAdminister;
      case "BENEFICIARY_INELIGIBLE":
        return Status.beneficiaryIneligible;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Status self) {
    switch (self) {
      case Status.delivered:
        return "DELIVERED";
      case Status.notDelivered:
        return "NOT_DELIVERED";
      case Status.visited:
        return "VISITED";
      case Status.notVisited:
        return "NOT_VISITED";
      case Status.beneficiaryRefused:
        return "BENEFICIARY_REFUSED";
      case Status.beneficiaryReferred:
        return "BENEFICIARY_REFERRED";
      case Status.administeredSuccess:
        return "ADMINISTERED_SUCCESS";
      case Status.administeredFailed:
        return "ADMINISTERED_FAILED";
      case Status.inComplete:
        return "IN_COMPLETE";
      case Status.toAdminister:
        return "TO_ADMINISTER";
      case Status.beneficiaryIneligible:
        return "BENEFICIARY_INELIGIBLE";
    }
  }
}

extension StatusMapperExtension on Status {
  dynamic toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Status>(this);
  }
}

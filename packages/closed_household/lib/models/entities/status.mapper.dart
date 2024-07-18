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
      case "CLOSED_HOUSEHOLD":
        return Status.closeHousehold;
      case "LOCATION_CAPTURE":
        return Status.locationCapture;
      case "REFUSED":
        return Status.refused;
      case "SPRAYED":
        return Status.sprayed;
      case "INELIGIBLE":
        return Status.ineligible;
      case "RESOLVED":
        return Status.resolved;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Status self) {
    switch (self) {
      case Status.closeHousehold:
        return "CLOSED_HOUSEHOLD";
      case Status.locationCapture:
        return "LOCATION_CAPTURE";
      case Status.refused:
        return "REFUSED";
      case Status.sprayed:
        return "SPRAYED";
      case Status.ineligible:
        return "INELIGIBLE";
      case Status.resolved:
        return "RESOLVED";
    }
  }
}

extension StatusMapperExtension on Status {
  dynamic toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Status>(this);
  }
}

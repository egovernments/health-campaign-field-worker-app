// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'action.dart';

class ActionsMapper extends EnumMapper<Actions> {
  ActionsMapper._();

  static ActionsMapper? _instance;
  static ActionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActionsMapper._());
    }
    return _instance!;
  }

  static Actions fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Actions decode(dynamic value) {
    switch (value) {
      case "CLOSED_HOUSEHOLD":
        return Actions.closeHousehold;
      case "LOCATION_CAPTURE":
        return Actions.locationCapture;
      case "OTHER":
        return Actions.other;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Actions self) {
    switch (self) {
      case Actions.closeHousehold:
        return "CLOSED_HOUSEHOLD";
      case Actions.locationCapture:
        return "LOCATION_CAPTURE";
      case Actions.other:
        return "OTHER";
    }
  }
}

extension ActionsMapperExtension on Actions {
  dynamic toValue() {
    ActionsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Actions>(this);
  }
}

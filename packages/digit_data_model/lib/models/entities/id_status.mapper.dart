// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'id_status.dart';

class IdStatusMapper extends EnumMapper<IdStatus> {
  IdStatusMapper._();

  static IdStatusMapper? _instance;
  static IdStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdStatusMapper._());
    }
    return _instance!;
  }

  static IdStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  IdStatus decode(dynamic value) {
    switch (value) {
      case "ASSIGNED":
        return IdStatus.assigned;
      case "UN_ASSIGNED":
        return IdStatus.unAssigned;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(IdStatus self) {
    switch (self) {
      case IdStatus.assigned:
        return "ASSIGNED";
      case IdStatus.unAssigned:
        return "UN_ASSIGNED";
    }
  }
}

extension IdStatusMapperExtension on IdStatus {
  dynamic toValue() {
    IdStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<IdStatus>(this);
  }
}

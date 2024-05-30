// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'deliver_strategy_type.dart';

class DeliverStrategyTypeMapper extends EnumMapper<DeliverStrategyType> {
  DeliverStrategyTypeMapper._();

  static DeliverStrategyTypeMapper? _instance;
  static DeliverStrategyTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeliverStrategyTypeMapper._());
    }
    return _instance!;
  }

  static DeliverStrategyType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DeliverStrategyType decode(dynamic value) {
    switch (value) {
      case "INDIRECT":
        return DeliverStrategyType.indirect;
      case "DIRECT":
        return DeliverStrategyType.direct;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DeliverStrategyType self) {
    switch (self) {
      case DeliverStrategyType.indirect:
        return "INDIRECT";
      case DeliverStrategyType.direct:
        return "DIRECT";
    }
  }
}

extension DeliverStrategyTypeMapperExtension on DeliverStrategyType {
  dynamic toValue() {
    DeliverStrategyTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DeliverStrategyType>(this);
  }
}

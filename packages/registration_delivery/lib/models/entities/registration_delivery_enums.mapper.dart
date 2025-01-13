// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'registration_delivery_enums.dart';

class RegistrationDeliveryEnumsMapper
    extends EnumMapper<RegistrationDeliveryEnums> {
  RegistrationDeliveryEnumsMapper._();

  static RegistrationDeliveryEnumsMapper? _instance;
  static RegistrationDeliveryEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = RegistrationDeliveryEnumsMapper._());
    }
    return _instance!;
  }

  static RegistrationDeliveryEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RegistrationDeliveryEnums decode(dynamic value) {
    switch (value) {
      case "name":
        return RegistrationDeliveryEnums.name;
      case "userName":
        return RegistrationDeliveryEnums.userName;
      case "IEC":
        return RegistrationDeliveryEnums.iec;
      case "ELIGIBILITY":
        return RegistrationDeliveryEnums.eligibility;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RegistrationDeliveryEnums self) {
    switch (self) {
      case RegistrationDeliveryEnums.name:
        return "name";
      case RegistrationDeliveryEnums.userName:
        return "userName";
      case RegistrationDeliveryEnums.iec:
        return "IEC";
      case RegistrationDeliveryEnums.eligibility:
        return "ELIGIBILITY";
    }
  }
}

extension RegistrationDeliveryEnumsMapperExtension
    on RegistrationDeliveryEnums {
  dynamic toValue() {
    RegistrationDeliveryEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RegistrationDeliveryEnums>(this);
  }
}

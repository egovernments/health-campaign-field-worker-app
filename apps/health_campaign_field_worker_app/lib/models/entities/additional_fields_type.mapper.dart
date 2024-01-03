// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'additional_fields_type.dart';

class AdditionalFieldsTypeMapper extends EnumMapper<AdditionalFieldsType> {
  AdditionalFieldsTypeMapper._();

  static AdditionalFieldsTypeMapper? _instance;
  static AdditionalFieldsTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalFieldsTypeMapper._());
    }
    return _instance!;
  }

  static AdditionalFieldsType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdditionalFieldsType decode(dynamic value) {
    switch (value) {
      case "deliveryStrategy":
        return AdditionalFieldsType.deliveryStrategy;
      case "cycleIndex":
        return AdditionalFieldsType.cycleIndex;
      case "doseIndex":
        return AdditionalFieldsType.doseIndex;
      case "dateOfVerification":
        return AdditionalFieldsType.dateOfVerification;
      case "dateOfAdministration":
        return AdditionalFieldsType.dateOfAdministration;
      case "dateOfDelivery":
        return AdditionalFieldsType.dateOfDelivery;
      case "referralComments":
        return AdditionalFieldsType.referralComments;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdditionalFieldsType self) {
    switch (self) {
      case AdditionalFieldsType.deliveryStrategy:
        return "deliveryStrategy";
      case AdditionalFieldsType.cycleIndex:
        return "cycleIndex";
      case AdditionalFieldsType.doseIndex:
        return "doseIndex";
      case AdditionalFieldsType.dateOfVerification:
        return "dateOfVerification";
      case AdditionalFieldsType.dateOfAdministration:
        return "dateOfAdministration";
      case AdditionalFieldsType.dateOfDelivery:
        return "dateOfDelivery";
      case AdditionalFieldsType.referralComments:
        return "referralComments";
    }
  }
}

extension AdditionalFieldsTypeMapperExtension on AdditionalFieldsType {
  dynamic toValue() {
    AdditionalFieldsTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdditionalFieldsType>(this);
  }
}

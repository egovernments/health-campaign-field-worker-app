// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'inventory_enums.dart';

class InventoryManagementEnumsMapper
    extends EnumMapper<InventoryManagementEnums> {
  InventoryManagementEnumsMapper._();

  static InventoryManagementEnumsMapper? _instance;
  static InventoryManagementEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = InventoryManagementEnumsMapper._());
    }
    return _instance!;
  }

  static InventoryManagementEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  InventoryManagementEnums decode(dynamic value) {
    switch (value) {
      case "waybill_quantity":
        return InventoryManagementEnums.wayBillQuantity;
      case "vehicle_number":
        return InventoryManagementEnums.vehicleNumber;
      case "comments":
        return InventoryManagementEnums.comments;
      case "deliveryTeam":
        return InventoryManagementEnums.deliveryTeam;
      case "lat":
        return InventoryManagementEnums.lat;
      case "lng":
        return InventoryManagementEnums.lng;
      case "name":
        return InventoryManagementEnums.name;
      case "userName":
        return InventoryManagementEnums.userName;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(InventoryManagementEnums self) {
    switch (self) {
      case InventoryManagementEnums.wayBillQuantity:
        return "waybill_quantity";
      case InventoryManagementEnums.vehicleNumber:
        return "vehicle_number";
      case InventoryManagementEnums.comments:
        return "comments";
      case InventoryManagementEnums.deliveryTeam:
        return "deliveryTeam";
      case InventoryManagementEnums.lat:
        return "lat";
      case InventoryManagementEnums.lng:
        return "lng";
      case InventoryManagementEnums.name:
        return "name";
      case InventoryManagementEnums.userName:
        return "userName";
    }
  }
}

extension InventoryManagementEnumsMapperExtension on InventoryManagementEnums {
  dynamic toValue() {
    InventoryManagementEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<InventoryManagementEnums>(this);
  }
}

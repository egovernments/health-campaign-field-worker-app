// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dss_enums.dart';

class DSSEnumsMapper extends EnumMapper<DSSEnums> {
  DSSEnumsMapper._();

  static DSSEnumsMapper? _instance;
  static DSSEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DSSEnumsMapper._());
    }
    return _instance!;
  }

  static DSSEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DSSEnums decode(dynamic value) {
    switch (value) {
      case "metric":
        return DSSEnums.metric;
      case "xtable":
        return DSSEnums.table;
      case "S.N.":
        return DSSEnums.serialNumber;
      case "startDate":
        return DSSEnums.startDate;
      case "endDate":
        return DSSEnums.endDate;
      case "number":
        return DSSEnums.number;
      case "percentage":
        return DSSEnums.percentage;
      case "responseData":
        return DSSEnums.responseData;
      case "day":
        return DSSEnums.day;
      case "home":
        return DSSEnums.home;
      case "row":
        return DSSEnums.row;
      case "uuid":
        return DSSEnums.uuid;
      case "projectId":
        return DSSEnums.projectId;
      case "Last synced time":
        return DSSEnums.lastSyncedTime;
      case "amount":
        return DSSEnums.amount;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DSSEnums self) {
    switch (self) {
      case DSSEnums.metric:
        return "metric";
      case DSSEnums.table:
        return "xtable";
      case DSSEnums.serialNumber:
        return "S.N.";
      case DSSEnums.startDate:
        return "startDate";
      case DSSEnums.endDate:
        return "endDate";
      case DSSEnums.number:
        return "number";
      case DSSEnums.percentage:
        return "percentage";
      case DSSEnums.responseData:
        return "responseData";
      case DSSEnums.day:
        return "day";
      case DSSEnums.home:
        return "home";
      case DSSEnums.row:
        return "row";
      case DSSEnums.uuid:
        return "uuid";
      case DSSEnums.projectId:
        return "projectId";
      case DSSEnums.lastSyncedTime:
        return "Last synced time";
      case DSSEnums.amount:
        return "amount";
    }
  }
}

extension DSSEnumsMapperExtension on DSSEnums {
  dynamic toValue() {
    DSSEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DSSEnums>(this);
  }
}

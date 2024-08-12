// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scanner_type.dart';

class ScannerTypeMapper extends EnumMapper<ScannerType> {
  ScannerTypeMapper._();

  static ScannerTypeMapper? _instance;
  static ScannerTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScannerTypeMapper._());
    }
    return _instance!;
  }

  static ScannerType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ScannerType decode(dynamic value) {
    switch (value) {
      case "GS1_SCANNER":
        return ScannerType.gS1Scanner;
      case "VOUCHER_LINK_SCANNER":
        return ScannerType.voucherLinkScanner;
      case "VOUCHER_SEARCH_SCANNER":
        return ScannerType.voucherSearchScanner;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ScannerType self) {
    switch (self) {
      case ScannerType.gS1Scanner:
        return "GS1_SCANNER";
      case ScannerType.voucherLinkScanner:
        return "VOUCHER_LINK_SCANNER";
      case ScannerType.voucherSearchScanner:
        return "VOUCHER_SEARCH_SCANNER";
    }
  }
}

extension ScannerTypeMapperExtension on ScannerType {
  dynamic toValue() {
    ScannerTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ScannerType>(this);
  }
}

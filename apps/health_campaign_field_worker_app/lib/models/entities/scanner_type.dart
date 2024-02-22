// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'scanner_type.mapper.dart';
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum ScannerType {
  @MappableValue("GS1_SCANNER") gS1Scanner,
  @MappableValue("VOUCHER_LINK_SCANNER") voucherLinkScanner,
  @MappableValue("VOUCHER_SEARCH_SCANNER") voucherSearchScanner,
  ;
}
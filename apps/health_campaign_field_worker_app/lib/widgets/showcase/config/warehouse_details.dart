part of 'showcase_constants.dart';

class _WarehouseDetailsShowcaseData {
  static final _WarehouseDetailsShowcaseData _instance =
      _WarehouseDetailsShowcaseData._();

  _WarehouseDetailsShowcaseData._();

  factory _WarehouseDetailsShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        dateOfReceipt,
        administrativeUnit,
        warehouseName,
      ];

  final dateOfReceipt = ShowcaseItemBuilder(
    messageLocalizationKey: i18.warehouseDetailsShowcase.dateOfReceipt,
  );

  final administrativeUnit = ShowcaseItemBuilder(
    messageLocalizationKey: i18.warehouseDetailsShowcase.administrativeUnit,
  );

  final warehouseName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.warehouseDetailsShowcase.warehouseName,
  );
}

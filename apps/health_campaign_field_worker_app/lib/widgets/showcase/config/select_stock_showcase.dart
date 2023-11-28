part of 'showcase_constants.dart';

class _SelectStockShowcaseData {
  static final _SelectStockShowcaseData _instance =
      _SelectStockShowcaseData._();

  _SelectStockShowcaseData._();

  factory _SelectStockShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        recordStockReceipt,
        recordStockIssued,
        recordStockReturned,
      ];

  final recordStockReceipt = ShowcaseItemBuilder(
    messageLocalizationKey: i18.selectStockShowcase.recordStockReceipt,
  );

  final recordStockIssued = ShowcaseItemBuilder(
    messageLocalizationKey: i18.selectStockShowcase.recordStockIssued,
  );

  final recordStockReturned = ShowcaseItemBuilder(
    messageLocalizationKey: i18.selectStockShowcase.recordStockReturned,
  );
}

part of 'showcase_constants.dart';

class _StockReconciliationShowcaseData {
  static final _StockReconciliationShowcaseData _instance =
      _StockReconciliationShowcaseData._();

  _StockReconciliationShowcaseData._();

  factory _StockReconciliationShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData => [
        warehouseName,
        dateOfReconciliation,
        stockReceived,
        stockIssued,
        stockOnHand,
        manualStockCount,
        comments,
      ];

  final warehouseName = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockReconciliationShowcase.warehouseName,
  );

  final dateOfReconciliation = ShowcaseItemBuilder(
    messageLocalizationKey:
        i18.stockReconciliationShowcase.dateOfReconciliation,
  );

  final stockReceived = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockReconciliationShowcase.stockReceived,
  );

  final stockIssued = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockReconciliationShowcase.stockIssued,
  );

  final stockOnHand = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockReconciliationShowcase.stockOnHand,
  );

  final manualStockCount = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockReconciliationShowcase.manualStockCount,
  );

  final comments = ShowcaseItemBuilder(
    messageLocalizationKey: i18.stockReconciliationShowcase.comments,
  );
}

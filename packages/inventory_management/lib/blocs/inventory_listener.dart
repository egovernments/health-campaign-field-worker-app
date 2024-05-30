import 'package:inventory_management/models/entities/stock_reconciliation.dart';

import '../models/entities/stock.dart';

// Class to hold the details for saving stock.
class SaveStockDetails {
  final StockModel stockModel;

  SaveStockDetails({
    required this.stockModel,
  });
}

// Class to hold the details for saving stock reconciliation.
class SaveStockReconciliationModel {
  final StockReconciliationModel stockReconciliationModel;
  final Map<String, Object> additionalData;

  SaveStockReconciliationModel({
    required this.stockReconciliationModel,
    required this.additionalData,
  });
}

// Class to hold the details for the stock reconciliation report.
class StockReconciliationReport {
  final Map<String, List<StockReconciliationModel>> stockReconModel;
  final Iterable<MapEntry<String, dynamic>> additionalData;

  StockReconciliationReport({
    required this.stockReconModel,
    required this.additionalData,
  });
}

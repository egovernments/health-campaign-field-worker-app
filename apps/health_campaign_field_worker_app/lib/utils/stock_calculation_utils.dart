import 'package:digit_data_model/data_model.dart';

class StockCalculationUtils {
  static String _getAdditionalFieldValue(StockModel stock, String key) {
    final fields = stock.additionalFields?.fields;
    if (fields == null) return '';
    for (final field in fields) {
      if (field.key == key) {
        return field.value?.toString().toUpperCase() ?? '';
      }
    }
    return '';
  }

  static String _getStockEntryType(StockModel stock) {
    return _getAdditionalFieldValue(stock, 'stockEntryType');
  }

  static Map<String, double> calculateStockMetrics({
    required List<StockModel> stockList,
    required String facilityId,
    required String productId,
    String? loggedInUserUuid,
    bool isDistributor = false,
  }) {
    final filteredStock = stockList.where((stock) {
      if (stock.productVariantId != productId) return false;
      return stock.receiverId == facilityId || stock.senderId == facilityId;
    }).toList();

    double stockReceived = 0;
    double stockIssued = 0;
    double stockReturned = 0;
    double stockLost = 0;
    double stockDamaged = 0;
    double stockExcess = 0;
    double stockLess = 0;
    double stockWastage = 0;
    bool hasDistributorReturns = isDistributor;

    for (final stock in filteredStock) {
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      final transactionReason = stock.transactionReason?.toUpperCase() ?? '';
      final quantity = double.tryParse(stock.quantity ?? '0') ?? 0.0;
      final status = _getAdditionalFieldValue(stock, 'status');
      final stockEntryType = _getStockEntryType(stock);
      final wastage =
          double.tryParse(_getAdditionalFieldValue(stock, 'quantityWastage')) ??
              0.0;
      final isReceiver = stock.receiverId == facilityId;
      final isSender = stock.senderId == facilityId;

      // Auto-detect distributor: if user is sender in a return, treat as distributor
      final isDistributorReturn = isSender && stockEntryType == 'RETURNED';
      if (isDistributorReturn) hasDistributorReturns = true;

      if (isDistributor || isDistributorReturn) {
        _processDistributorStock(
          transactionType: transactionType,
          stockEntryType: stockEntryType,
          quantity: quantity,
          wastage: wastage,
          status: status,
          stockReceived: (v) => stockReceived += v,
          stockReturned: (v) => stockReturned += v,
          stockWastage: (v) => stockWastage += v,
          stockExcess: (v) => stockExcess += v,
          stockLess: (v) => stockLess += v,
          stockLost: (v) => stockLost += v,
          stockDamaged: (v) => stockDamaged += v,
        );
        continue;
      }

      if (isReceiver && transactionType == 'RECEIVED') {
        _categorizeReceivedStock(
          transactionReason: transactionReason,
          stockEntryType: stockEntryType,
          quantity: quantity,
          stockReceived: (v) => stockReceived += v,
          stockReturned: (v) => stockReturned += v,
          stockExcess: (v) => stockExcess += v,
          stockLess: (v) => stockLess += v,
        );
      } else if (isSender && transactionType == 'DISPATCHED') {
        _categorizeDispatchedStock(
          transactionReason: transactionReason,
          stockEntryType: stockEntryType,
          quantity: quantity,
          status: status,
          stockIssued: (v) => stockIssued += v,
          stockReturned: (v) => stockReturned += v,
          stockLost: (v) => stockLost += v,
          stockDamaged: (v) => stockDamaged += v,
        );
      } else if (isSender && stockEntryType == 'LOSS') {
        stockLost += quantity;
      } else if (isSender && stockEntryType == 'DAMAGED') {
        stockDamaged += quantity;
      } else if (isReceiver &&
          transactionType == 'DISPATCHED' &&
          status == 'ACCEPTED') {
        stockReceived += quantity;
      }
    }

    // Use distributor calculation if user has distributor role OR if any return was made as sender
    final double stockInHand = hasDistributorReturns
        ? stockReceived -
            (stockReturned +
                stockWastage +
                stockIssued +
                stockDamaged +
                stockLost)
        : stockReceived +
            stockReturned -
            (stockIssued + stockDamaged + stockLost);

    return {
      'stockReceived': stockReceived,
      'stockIssued': stockIssued,
      'stockReturned': stockReturned,
      'stockLost': stockLost,
      'stockDamaged': stockDamaged,
      'stockExcess': stockExcess,
      'stockLess': stockLess,
      'stockWastage': stockWastage,
      'stockInHand': stockInHand,
    };
  }

  static void _processDistributorStock({
    required String transactionType,
    required String stockEntryType,
    required double quantity,
    required double wastage,
    required String status,
    required void Function(double) stockReceived,
    required void Function(double) stockReturned,
    required void Function(double) stockWastage,
    required void Function(double) stockExcess,
    required void Function(double) stockLess,
    required void Function(double) stockLost,
    required void Function(double) stockDamaged,
  }) {
    if (transactionType == 'RECEIVED') {
      if (stockEntryType == 'RETURNED') {
        stockReturned(quantity);
        stockWastage(wastage);
      } else if (stockEntryType == 'EXCESS') {
        stockExcess(quantity);
      } else if (stockEntryType == 'LESS') {
        stockLess(quantity);
      } else {
        stockReceived(quantity);
      }
    } else if (transactionType == 'DISPATCHED') {
      if (stockEntryType == 'RETURNED') {
        stockReturned(quantity);
        stockWastage(wastage);
      } else if (status == 'ACCEPTED') {
        stockReceived(quantity);
      } else if (stockEntryType == 'LOSS') {
        stockLost(quantity);
      } else if (stockEntryType == 'DAMAGED') {
        stockDamaged(quantity);
      }
    }
  }

  static void _categorizeReceivedStock({
    required String transactionReason,
    required String stockEntryType,
    required double quantity,
    required void Function(double) stockReceived,
    required void Function(double) stockReturned,
    required void Function(double) stockExcess,
    required void Function(double) stockLess,
  }) {
    if (transactionReason == 'RETURNED' || stockEntryType == 'RETURNED') {
      stockReturned(quantity);
    } else if (stockEntryType == 'EXCESS') {
      stockExcess(quantity);
    } else if (stockEntryType == 'LESS') {
      stockLess(quantity);
    } else {
      stockReceived(quantity);
    }
  }

  static void _categorizeDispatchedStock({
    required String transactionReason,
    required String stockEntryType,
    required double quantity,
    required String status,
    required void Function(double) stockIssued,
    required void Function(double) stockReturned,
    required void Function(double) stockLost,
    required void Function(double) stockDamaged,
  }) {
    if (status == 'REJECTED') return;
    if (transactionReason == 'LOST_IN_TRANSIT' ||
        transactionReason == 'LOST_IN_STORAGE' ||
        stockEntryType == 'LOSS') {
      stockLost(quantity);
    } else if (transactionReason == 'DAMAGED_IN_TRANSIT' ||
        transactionReason == 'DAMAGED_IN_STORAGE' ||
        stockEntryType == 'DAMAGED') {
      stockDamaged(quantity);
    } else if (stockEntryType == 'RETURNED') {
      stockReturned(quantity);
    } else {
      stockIssued(quantity);
    }
  }

  static Map<String, double> calculateStockInHandForProducts({
    required List<StockModel> stockList,
    required String facilityId,
    required List<String> productIds,
    String? loggedInUserUuid,
  }) {
    final result = <String, double>{};
    for (final productId in productIds) {
      final metrics = calculateStockMetrics(
        stockList: stockList,
        facilityId: facilityId,
        productId: productId,
        loggedInUserUuid: loggedInUserUuid,
      );
      result[productId] = metrics['stockInHand'] ?? 0.0;
    }
    return result;
  }

  static Map<String, double> get emptyMetrics => {
        'stockReceived': 0,
        'stockIssued': 0,
        'stockReturned': 0,
        'stockLost': 0,
        'stockDamaged': 0,
        'stockExcess': 0,
        'stockLess': 0,
        'stockWastage': 0,
        'stockInHand': 0,
      };

  static List<StockModel> extractStockListFromWrapper(
      List<dynamic>? stateWrapper) {
    if (stateWrapper == null || stateWrapper.isEmpty) return [];

    try {
      for (final wrapperMap in stateWrapper) {
        if (wrapperMap is Map) {
          List? stockData;
          if (wrapperMap.containsKey('StockModel')) {
            stockData = wrapperMap['StockModel'] as List?;
          } else if (wrapperMap.containsKey('stock')) {
            stockData = wrapperMap['stock'] as List?;
          }

          if (stockData != null && stockData.isNotEmpty) {
            return stockData
                .map((e) => e is StockModel
                    ? e
                    : StockModelMapper.fromMap(e as Map<String, dynamic>))
                .toList();
          }
        }
      }
    } catch (e) {
      // Silently handle parsing errors
    }

    return [];
  }
}

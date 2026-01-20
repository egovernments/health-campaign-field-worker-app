import 'package:digit_data_model/data_model.dart';
import 'package:flutter/foundation.dart';

/// Utility class for calculating stock metrics.
///
/// This provides common stock calculation methods that can be reused across
/// different widgets like StockReconciliationCard and ProductSelectionCard.
class StockCalculationUtils {
  /// Calculates stock metrics for a given facility and product from a list of stocks.
  ///
  /// Parameters:
  /// - [stockList]: List of StockModel entries to calculate from
  /// - [facilityId]: The facility ID to filter stocks by (as sender or receiver)
  /// - [productId]: The product variant ID to filter stocks by
  /// - [loggedInUserUuid]: Optional user UUID to filter stocks created by this user
  ///
  /// Returns a Map with the following keys:
  /// - stockReceived: Total quantity received
  /// - stockIssued: Total quantity issued/dispatched
  /// - stockReturned: Total quantity returned
  /// - stockLost: Total quantity lost
  /// - stockDamaged: Total quantity damaged
  /// - stockInHand: Calculated as (received + returned) - (issued + damaged + lost)
  static Map<String, double> calculateStockMetrics({
    required List<StockModel> stockList,
    required String facilityId,
    required String productId,
    String? loggedInUserUuid,
  }) {
    // Filter stocks matching the criteria:
    // 1. Filter by productVariantId
    // 2. Filter by facility (either as receiver or sender)
    // 3. Optionally filter by logged-in user (stocks created by current user only)
    final filteredStock = stockList.where((stock) {
      // Must match product
      if (stock.productVariantId != productId) return false;

      // Must match facility (as receiver OR sender)
      final matchesReceiver = stock.receiverId == facilityId;
      final matchesSender = stock.senderId == facilityId;
      if (!matchesReceiver && !matchesSender) return false;

      // Optionally filter by logged-in user
      if (loggedInUserUuid != null &&
          stock.auditDetails?.createdBy != loggedInUserUuid) {
        return false;
      }

      return true;
    }).toList();

    debugPrint(
        'StockCalculationUtils: Calculating metrics for ${filteredStock.length} stocks '
        '(facility=$facilityId, product=$productId, user=$loggedInUserUuid)');

    // Calculate metrics following StockReconciliationBloc pattern
    double stockReceived = 0;
    double stockIssued = 0;
    double stockReturned = 0;
    double stockLost = 0;
    double stockDamaged = 0;

    for (final stock in filteredStock) {
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      final transactionReason = stock.transactionReason?.toUpperCase() ?? '';
      final quantity = num.tryParse(stock.quantity ?? '0') ?? 0.0;

      // Check if this facility is the receiver or sender
      final isReceiver = stock.receiverId == facilityId;
      final isSender = stock.senderId == facilityId;

      debugPrint(
          'StockCalculationUtils: Processing stock - type=$transactionType, '
          'reason=$transactionReason, qty=$quantity, isReceiver=$isReceiver, isSender=$isSender');

      // Stock Received: This facility is the receiver AND transactionType == RECEIVED
      // Accept both: transactionReason == 'RECEIVED' OR transactionReason is empty/null
      if (isReceiver && transactionType == 'RECEIVED') {
        if (transactionReason == 'RETURNED') {
          // Stock Returned: transactionReason == RETURNED
          stockReturned += quantity;
          debugPrint('  -> Counted as RETURNED: $quantity');
        } else if (transactionReason.isEmpty ||
            transactionReason == 'RECEIVED') {
          // Regular stock receipt
          stockReceived += quantity;
          debugPrint('  -> Counted as RECEIVED: $quantity');
        }
      }
      // Stock Issued/Lost/Damaged: This facility is the sender AND transactionType == DISPATCHED
      else if (isSender && transactionType == 'DISPATCHED') {
        if (transactionReason == 'LOST_IN_TRANSIT' ||
            transactionReason == 'LOST_IN_STORAGE') {
          // Stock Lost
          stockLost += quantity;
          debugPrint('  -> Counted as LOST: $quantity');
        } else if (transactionReason == 'DAMAGED_IN_TRANSIT' ||
            transactionReason == 'DAMAGED_IN_STORAGE') {
          // Stock Damaged
          stockDamaged += quantity;
          debugPrint('  -> Counted as DAMAGED: $quantity');
        } else if (transactionReason.isEmpty) {
          // Regular dispatch (issued)
          stockIssued += quantity;
          debugPrint('  -> Counted as ISSUED: $quantity');
        }
      } else {
        debugPrint('  -> NOT counted (not matching facility role)');
      }
    }

    // Stock in hand = (received + returned) - (issued + damaged + lost)
    final stockInHand = (stockReceived + stockReturned) -
        (stockIssued + stockDamaged + stockLost);

    debugPrint(
        'StockCalculationUtils: Final metrics - received=$stockReceived, '
        'issued=$stockIssued, returned=$stockReturned, lost=$stockLost, '
        'damaged=$stockDamaged, inHand=$stockInHand');

    return {
      'stockReceived': stockReceived,
      'stockIssued': stockIssued,
      'stockReturned': stockReturned,
      'stockLost': stockLost,
      'stockDamaged': stockDamaged,
      'stockInHand': stockInHand,
    };
  }

  /// Calculates stock in hand for multiple products at once.
  ///
  /// Parameters:
  /// - [stockList]: List of StockModel entries to calculate from
  /// - [facilityId]: The facility ID to filter stocks by
  /// - [productIds]: List of product variant IDs to calculate for
  /// - [loggedInUserUuid]: Optional user UUID to filter stocks
  ///
  /// Returns a Map where keys are productIds and values are stockInHand quantities.
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

    debugPrint('StockCalculationUtils: Stock in hand for products: $result');
    return result;
  }

  /// Returns empty/zero stock metrics map.
  static Map<String, double> get emptyMetrics => {
        'stockReceived': 0,
        'stockIssued': 0,
        'stockReturned': 0,
        'stockLost': 0,
        'stockDamaged': 0,
        'stockInHand': 0,
      };

  /// Extracts StockModel list from FlowCrudState's stateWrapper.
  ///
  /// This helper method parses the stateWrapper structure to extract
  /// StockModel entries.
  static List<StockModel> extractStockListFromWrapper(
      List<dynamic>? stateWrapper) {
    if (stateWrapper == null || stateWrapper.isEmpty) return [];

    try {
      for (final wrapperMap in stateWrapper) {
        if (wrapperMap is Map && wrapperMap.containsKey('StockModel')) {
          final stockData = wrapperMap['StockModel'] as List?;
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
      debugPrint('StockCalculationUtils: Error parsing stock data: $e');
    }

    return [];
  }
}

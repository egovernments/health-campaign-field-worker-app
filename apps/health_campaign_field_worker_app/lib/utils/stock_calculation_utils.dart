import 'package:digit_data_model/data_model.dart';

/// Utility class for calculating stock metrics.
///
/// This provides common stock calculation methods that can be reused across
/// different widgets like StockReconciliationCard and ProductSelectionCard.
class StockCalculationUtils {
  /// Extracts a value from a StockModel's additionalFields by key.
  /// Returns uppercase string value or empty string if not found.
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

  /// Extracts the stockEntryType from a StockModel's additionalFields.
  /// Returns uppercase value (e.g., 'RECEIPT', 'ISSUED', 'RETURNED', 'DAMAGED', 'LOSS')
  /// or empty string if not found.
  static String _getStockEntryType(StockModel stock) {
    return _getAdditionalFieldValue(stock, 'stockEntryType');
  }

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
  /// - stockInHand: Calculated as (received) - (issued + returned + damaged + lost). Excess/less are tracked but do not affect balance.
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

      // Optionally filter by logged-in user (created by OR modified by)
      if (loggedInUserUuid != null &&
          stock.auditDetails?.createdBy != loggedInUserUuid &&
          stock.clientAuditDetails?.lastModifiedBy != loggedInUserUuid) {
        return false;
      }

      return true;
    }).toList();

    // Calculate metrics following StockReconciliationBloc pattern
    double stockReceived = 0;
    double stockIssued = 0;
    double stockReturned = 0;
    double stockLost = 0;
    double stockDamaged = 0;
    double stockExcess = 0;
    double stockLess = 0;

    for (final stock in filteredStock) {
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      final transactionReason = stock.transactionReason?.toUpperCase() ?? '';
      final quantity = num.tryParse(stock.quantity ?? '0') ?? 0.0;

      // Extract stockEntryType from additionalFields as fallback
      final stockEntryType = _getStockEntryType(stock);

      // Check if this facility is the receiver or sender
      final isReceiver = stock.receiverId == facilityId;
      final isSender = stock.senderId == facilityId;

      // Stock Received/Excess/Less: This facility is the receiver AND transactionType == RECEIVED
      // Both LESS and EXCESS use RECEIVED transactionType, differentiated by stockEntryType
      if (isReceiver && transactionType == 'RECEIVED') {
        if (transactionReason == 'RETURNED' || stockEntryType == 'RETURNED') {
          stockReturned += quantity;
        } else if (stockEntryType == 'EXCESS') {
          // Stock Excess: recorded via less/excess flow
          stockExcess += quantity;
        } else if (stockEntryType == 'LESS') {
          // Stock Less: recorded via less/excess flow
          stockLess += quantity;
        } else if (transactionReason.isEmpty ||
            transactionReason == 'RECEIVED') {
          stockReceived += quantity;
        }
      }
      // Stock Lost: transactionType == LOSS
      else if (isSender && transactionType == 'LOSS') {
        stockLost += quantity;
      }
      // Stock Damaged: transactionType == DAMAGED
      else if (isSender && transactionType == 'DAMAGED') {
        stockDamaged += quantity;
      }
      // Stock Issued/Lost/Damaged: This facility is the sender AND transactionType == DISPATCHED
      // Check sender first so damage/loss is counted correctly when senderId == receiverId
      else if (isSender && transactionType == 'DISPATCHED') {
        final status = _getAdditionalFieldValue(stock, 'status');
        // If the receiver rejected this stock, it comes back to the sender.
        // Don't count as issued so the quantity stays in sender's balance.
        if (status == 'REJECTED') {
          // Skip - rejected stock is not subtracted from sender's balance
        } else if (transactionReason == 'LOST_IN_TRANSIT' ||
            transactionReason == 'LOST_IN_STORAGE' ||
            stockEntryType == 'LOSS') {
          stockLost += quantity;
        } else if (transactionReason == 'DAMAGED_IN_TRANSIT' ||
            transactionReason == 'DAMAGED_IN_STORAGE' ||
            stockEntryType == 'DAMAGED') {
          stockDamaged += quantity;
        } else if (stockEntryType == 'REJECTED') {
          // Rejected stock - not counted as issued since it was never accepted
        } else if (stockEntryType == 'RETURNED') {
          // Reverse logistics: returned stock dispatched out
          stockReturned += quantity;
        } else {
          // Regular dispatch (issued)
          stockIssued += quantity;
        }
      }
      // Stock Received from dispatch: This facility is the receiver AND transactionType == DISPATCHED
      // Incoming dispatches are only counted as received if the status is ACCEPTED.
      // Pending/IN_TRANSIT dispatches are not counted until explicitly accepted.
      else if (isReceiver && transactionType == 'DISPATCHED') {
        final status = _getAdditionalFieldValue(stock, 'status');
        if (status == 'ACCEPTED') {
          stockReceived += quantity;
        }
      }
    }

    // Stock in hand = (received + returned) - (issued + damaged + lost)
    // Note: excess and less are tracked for backend reporting only and do not affect balance
    final stockInHand = stockReceived -
        (stockIssued + stockReturned + stockDamaged + stockLost);

    return {
      'stockReceived': stockReceived,
      'stockIssued': stockIssued,
      'stockReturned': stockReturned,
      'stockLost': stockLost,
      'stockDamaged': stockDamaged,
      'stockExcess': stockExcess,
      'stockLess': stockLess,
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

    return result;
  }

  /// Returns empty/zero stock metrics map.
  static Map<String, double> get emptyMetrics => {
        'stockReceived': 0,
        'stockIssued': 0,
        'stockReturned': 0,
        'stockLost': 0,
        'stockDamaged': 0,
        'stockExcess': 0,
        'stockLess': 0,
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
        if (wrapperMap is Map) {
          // Check for both 'StockModel' and 'stock' keys (CrudBloc uses 'stock')
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

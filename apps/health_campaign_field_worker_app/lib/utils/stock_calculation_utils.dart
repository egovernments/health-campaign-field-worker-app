import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/utils/utils.dart';

/// Derives the campaign-suffix segment from a project `referenceID`.
/// Returns text after the last `-` (e.g. `CMP-2025-08-04-004846` → `004846`);
/// when no `-` is present, the trailing 6 chars are used. Returns an empty
/// string for null/empty input.
String _campaignSuffixFromReferenceID(String? referenceID) {
  if (referenceID == null || referenceID.isEmpty) return '';
  final idx = referenceID.lastIndexOf('-');
  if (idx >= 0 && idx < referenceID.length - 1) {
    return referenceID.substring(idx + 1);
  }
  return referenceID.length <= 6
      ? referenceID
      : referenceID.substring(referenceID.length - 6);
}

/// Suffix derived from `FlowBuilderSingleton().selectedProject`. Returns an
/// empty string when no project is selected — callers that run before the
/// singleton is populated (e.g. `downSyncStockBalances` during project bloc
/// startup) should pass `projectReferenceID` to [generateBalanceKey]
/// explicitly instead of relying on this fallback.
String _activeCampaignSuffix() => _campaignSuffixFromReferenceID(
      FlowBuilderSingleton().selectedProject?.referenceID,
    );

/// True when [s] is a canonical 36-char UUID (`xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`).
/// Used to decide whether to compact the facility segment of the balance key —
/// distributors / community distributors carry their userUuid as facilityId, and
/// the full UUID combined with a productVariantId + campaign suffix overflows
/// the server's 64-char clientReferenceId limit. Non-UUID facilities (e.g.
/// `F-2026-06-15-233125`) already fit, so we leave them alone.
bool _isCanonicalUuid(String s) {
  if (s.length != 36) return false;
  return s[8] == '-' && s[13] == '-' && s[18] == '-' && s[23] == '-';
}

/// Compacts a UUID-shaped facilityId to 16 hex chars by keeping the first 4
/// and last 12 hex chars (hyphens dropped). Non-UUID input is returned
/// unchanged. Designed to keep keys short enough to fit under the 64-char
/// server limit even when facilityId is a distributor's userUuid.
///
/// Math: 48 bits of entropy from the last 12 chars alone makes intra-project
/// collisions vanishingly unlikely; the extra 4 chars at the front are kept
/// for visual disambiguation in logs/admin tools, not statistical safety.
String _compactFacilityToken(String facilityId) {
  if (!_isCanonicalUuid(facilityId)) return facilityId;
  final hex = facilityId.replaceAll('-', ''); // 32 hex chars
  return '${hex.substring(0, 4)}${hex.substring(hex.length - 12)}';
}

/// Generates a balance key for UserAction STOCK_BALANCE records.
///
/// Active shape (current): `bal_{compactFacility}{productVariantId}_{campaignSuffix}`
/// where `compactFacility` is [_compactFacilityToken] applied to [facilityId].
///
/// Intermediate shape (post-suffix, pre-compaction):
/// `bal_{facilityId}{productVariantId}_{campaignSuffix}` — produced by
/// [readableBalanceKey], retained for migration of devices that wrote balances
/// after the campaign-suffix change but before the compaction change.
///
/// Legacy shape (pre-suffix): `bal_{facilityId}{productVariantId}` — produced
/// by [legacyBalanceKey].
///
/// Pass [projectReferenceID] when calling outside an action-handler context —
/// e.g. during downsync — where `FlowBuilderSingleton().selectedProject`
/// may not yet be populated. When omitted, the active singleton project is
/// used (sufficient inside post-login executors).
///
/// Migration: writers should use this active shape; readers that need to find
/// older local rows should also try [readableBalanceKey] and [legacyBalanceKey]
/// in that order before treating a balance as missing.
String generateBalanceKey(
  String facilityId,
  String productVariantId, {
  String? projectReferenceID,
}) {
  final suffix = projectReferenceID != null
      ? _campaignSuffixFromReferenceID(projectReferenceID)
      : _activeCampaignSuffix();
  final base = 'bal_${_compactFacilityToken(facilityId)}$productVariantId';
  return suffix.isEmpty ? base : '${base}_$suffix';
}

/// Intermediate shape that includes the campaign suffix but keeps the full
/// (uncompacted) facilityId. Used to migrate devices that wrote balances
/// after commit 751bec251 but before facility compaction landed.
String readableBalanceKey(
  String facilityId,
  String productVariantId, {
  String? projectReferenceID,
}) {
  final suffix = projectReferenceID != null
      ? _campaignSuffixFromReferenceID(projectReferenceID)
      : _activeCampaignSuffix();
  final base = 'bal_$facilityId$productVariantId';
  return suffix.isEmpty ? base : '${base}_$suffix';
}

/// Pre-campaign-suffix shape of the balance key. Retained for the
/// copy-on-first-touch migration in stock balance writers and dual-key
/// search in batch readers.
String legacyBalanceKey(String facilityId, String productVariantId) =>
    'bal_$facilityId$productVariantId';

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

  /// Case-preserving variant of [_getAdditionalFieldValue]. Use for values that
  /// are identifiers (e.g. `dispatchClientReferenceId`) where uppercasing
  /// would corrupt the data.
  static String _getAdditionalFieldRawValue(StockModel stock, String key) {
    final fields = stock.additionalFields?.fields;
    if (fields == null) return '';
    for (final field in fields) {
      if (field.key == key) {
        return field.value?.toString() ?? '';
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
    bool calculatePartial = false,
  }) {
    final filteredStock = stockList.where((stock) {
      if (stock.productVariantId != productId) return false;
      return stock.receiverId == facilityId || stock.senderId == facilityId;
    }).toList();

    // Set of inbound DISPATCHED clientReferenceIds that have already been
    // "claimed" by a local RECEIVED row carrying
    // additionalFields.dispatchClientReferenceId. Used below to skip the
    // legacy `DISPATCHED + status=ACCEPTED` branch so it doesn't double-count
    // alongside the new RECEIVED row produced by the two-write Accept flow
    // and the CDD scan flow.
    //
    // Rollout bridge — remove when every campaign's `manage_stock` config has
    // been rotated to include the `CREATE_EVENT` on Accept (so every Accept
    // produces a receiver-owned RECEIVED row). At that point the legacy
    // `isReceiver + DISPATCHED + status=ACCEPTED` branches below and this
    // set can be deleted together, leaving the pure
    // "sum receiver-owned RECEIVED" rule from `stock-receive-flow.html`.
    final dispatchRefsClaimedByReceived = filteredStock
        .where((s) => (s.transactionType?.toUpperCase() ?? '') == 'RECEIVED')
        .map((s) => _getAdditionalFieldRawValue(s, 'dispatchClientReferenceId'))
        .where((v) => v.isNotEmpty)
        .toSet();

    double stockReceived = 0;
    double stockIssued = 0;
    double stockReturned = 0;
    double stockLost = 0;
    double stockDamaged = 0;
    double stockExcess = 0;
    double stockLess = 0;
    bool hasDistributorReturns = isDistributor;

    for (final stock in filteredStock) {
      final transactionType = stock.transactionType?.toUpperCase() ?? '';
      final transactionReason = stock.transactionReason?.toUpperCase() ?? '';
      final quantity = double.tryParse(stock.quantity ?? '0') ?? 0.0;
      final status = _getAdditionalFieldValue(stock, 'status');
      final stockEntryType = _getStockEntryType(stock);
      final isReceiver = stock.receiverId == facilityId;
      final isSender = stock.senderId == facilityId;

      // Auto-detect distributor: if user is sender in a return, treat as distributor
      final isDistributorReturn =
          isSender && stockEntryType == 'RETURNED' && isDistributor;
      if (isDistributorReturn) hasDistributorReturns = true;

      if (isDistributor || isDistributorReturn) {
        _processDistributorStock(
          transactionType: transactionType,
          stockEntryType: stockEntryType,
          quantity: quantity,
          status: status,
          alreadyClaimedByReceived: dispatchRefsClaimedByReceived
              .contains(stock.clientReferenceId),
          stockReceived: (v) => stockReceived += v,
          stockReturned: (v) => stockReturned += v,
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
          stockReturned: (v) => stockReturned -= v,
          stockLost: (v) => stockLost += v,
          stockDamaged: (v) => stockDamaged += v,
        );
      } else if (isSender && stockEntryType == 'LOSS') {
        stockLost += quantity;
      } else if (isSender && stockEntryType == 'DAMAGED') {
        stockDamaged += quantity;
      } else if (isReceiver &&
          transactionType == 'DISPATCHED' &&
          status == 'ACCEPTED' &&
          !dispatchRefsClaimedByReceived.contains(stock.clientReferenceId)) {
        // Legacy path: count the inbound DISPATCHED-status-ACCEPTED row only
        // when no local RECEIVED row has already claimed it via
        // additionalFields.dispatchClientReferenceId. New two-write Accept and
        // CDD scan flows produce that RECEIVED row, which is summed via the
        // `RECEIVED` branch above — the skip here prevents double-counting.
        stockReceived += quantity;
      }
    }

    // Use distributor calculation if user has distributor role OR if any return was made as sender
    // For distributor, partial used is also deducted from stock in hand
    final double stockInHand = hasDistributorReturns
        ? stockReceived -
            (stockReturned + stockIssued + stockDamaged + stockLost)
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
      'stockInHand': stockInHand,
    };
  }

  static void _processDistributorStock({
    required String transactionType,
    required String stockEntryType,
    required double quantity,
    required String status,
    required bool alreadyClaimedByReceived,
    required void Function(double) stockReceived,
    required void Function(double) stockReturned,
    required void Function(double) stockExcess,
    required void Function(double) stockLess,
    required void Function(double) stockLost,
    required void Function(double) stockDamaged,
  }) {
    if (transactionType == 'RECEIVED') {
      if (stockEntryType == 'RETURNED') {
        stockReturned(quantity);
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
      } else if (status == 'ACCEPTED' && !alreadyClaimedByReceived) {
        // Legacy receiver-balance path; skipped when a local RECEIVED row has
        // already claimed this inbound via dispatchClientReferenceId.
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
    bool isDistributor = false,
  }) {
    final result = <String, double>{};
    for (final productId in productIds) {
      final metrics = calculateStockMetrics(
        stockList: stockList,
        facilityId: facilityId,
        productId: productId,
        loggedInUserUuid: loggedInUserUuid,
        isDistributor: isDistributor,
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
        'stockInHand': 0,
      };

  static double getStockBalance({
    required List<StockModel> stockList,
    required String facilityId,
    required String productId,
    String? loggedInUserUuid,
    bool isDistributor = false,
    bool calculatePartial = false,
  }) {
    final metrics = calculateStockMetrics(
      stockList: stockList,
      facilityId: facilityId,
      productId: productId,
      loggedInUserUuid: loggedInUserUuid,
      isDistributor: isDistributor,
      calculatePartial: calculatePartial,
    );
    return metrics['stockInHand'] ?? 0.0;
  }

  static Map<String, double> getStockMetrics({
    required List<StockModel> stockList,
    required String facilityId,
    required String productId,
    String? loggedInUserUuid,
    bool isDistributor = false,
    bool calculatePartial = false,
  }) {
    return calculateStockMetrics(
      stockList: stockList,
      facilityId: facilityId,
      productId: productId,
      loggedInUserUuid: loggedInUserUuid,
      isDistributor: isDistributor,
      calculatePartial: calculatePartial,
    );
  }

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

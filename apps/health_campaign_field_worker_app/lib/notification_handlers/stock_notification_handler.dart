import 'package:flutter/material.dart';

import '../utils/stock_downsync_utils.dart';
import 'notification_handler.dart';

class StockNotificationHandler implements NotificationHandler {
  @override
  void handle(BuildContext context, Map<String, dynamic> payload) {
    try {
      triggerStockDownSync(context);
    } catch (e) {
      debugPrint('Stock notification handler failed: $e');
    }
  }
}

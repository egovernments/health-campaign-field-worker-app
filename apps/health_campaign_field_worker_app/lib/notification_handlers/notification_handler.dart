import 'package:flutter/material.dart';

import '../models/entities/notification_data.dart';
import 'stock_notification_handler.dart';
import 'referral_notification_handler.dart';

/// Interface for handling notifications by type.
abstract class NotificationHandler {
  void handle(BuildContext context, Map<String, dynamic> payload);
}

/// Factory that returns the correct handler based on [NotificationType].
class NotificationHandlerFactory {
  static NotificationHandler? getHandler(NotificationType? type) {
    switch (type) {
      case NotificationType.stock:
        return StockNotificationHandler();
      case NotificationType.referral:
        return ReferralNotificationHandler();
      default:
        return null;
    }
  }
}

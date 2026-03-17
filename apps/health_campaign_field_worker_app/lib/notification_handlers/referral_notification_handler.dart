import 'package:flutter/material.dart';

import '../router/app_router.dart';
import 'notification_handler.dart';

class ReferralNotificationHandler implements NotificationHandler {
  @override
  void handle(BuildContext context, Map<String, dynamic> payload) {
    try {
      context.router.replaceAll([BoundarySelectionRoute()]);
    } catch (e) {
      debugPrint('Referral notification handler failed: $e');
    }
  }
}

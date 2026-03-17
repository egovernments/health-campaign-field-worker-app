import 'package:flutter/material.dart';

import 'notification_handler.dart';

class ReferralNotificationHandler implements NotificationHandler {
  @override
  void handle(BuildContext context, Map<String, dynamic> payload) {
    // TODO: Implement referral handling logic
    debugPrint('Referral notification received with payload: $payload');
  }
}

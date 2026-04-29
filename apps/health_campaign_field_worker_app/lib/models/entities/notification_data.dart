import 'dart:convert';

enum NotificationType {
  stock('STOCK'),
  referral('REFERRAL');

  final String value;
  const NotificationType(this.value);

  static NotificationType? fromValue(String? value) {
    if (value == null) return null;
    return NotificationType.values.cast<NotificationType?>().firstWhere(
          (e) => e!.value == value,
          orElse: () => null,
        );
  }
}

class NotificationData {
  final NotificationType? notificationType;
  final Map<String, dynamic> payload;

  const NotificationData({
    this.notificationType,
    this.payload = const {},
  });

  factory NotificationData.fromMap(Map<String, dynamic> data) {
    Map<String, dynamic> decodedPayload = {};
    try {
      if (data['payload'] is String) {
        decodedPayload =
            jsonDecode(data['payload']) as Map<String, dynamic>;
      }
    } catch (_) {}

    return NotificationData(
      notificationType: NotificationType.fromValue(data['notificationType']),
      payload: decodedPayload,
    );
  }
}

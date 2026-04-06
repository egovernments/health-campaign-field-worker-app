import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Top-level background message handler for FCM.
/// Must be a top-level function (not a class method).
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Background messages are handled by the system notification tray.
  // No additional processing needed here.
  debugPrint('FCM background message: ${message.messageId}');
}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Callback invoked when user taps a notification.
  /// The map contains the FCM data payload.
  void Function(Map<String, dynamic>)? onNotificationTap;

  static const String _fcmTokenKey = 'fcm_device_token';
  static const String _fcmTokenMapKey = 'fcm_device_token_map';
  static const String _channelId = 'fcm_default_channel';
  static const String _channelName = 'Push Notifications';
  static const String _channelDescription =
      'Channel for FCM push notifications';

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create the Android notification channel
    if (Platform.isAndroid) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }

  /// Initialize FCM: request permissions, get token, set up listeners.
  Future<String?> initializeFCM() async {
    debugPrint('FCM: Starting initialization...');
    final messaging = FirebaseMessaging.instance;

    // Request notification permissions
    final settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    debugPrint('FCM: Permission status = ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      debugPrint('FCM: User denied notification permissions');
      return null;
    }

    // Get and store the FCM token
    final token = await messaging.getToken();
    debugPrint('FCM: Token received = ${token != null ? 'YES' : 'NULL'}');
    if (token != null) {
      await _storeFcmToken(token);
    } else {
      debugPrint('FCM: WARNING - getToken() returned null');
    }

    // Listen for token refresh
    messaging.onTokenRefresh.listen((newToken) async {
      await _storeFcmToken(newToken);
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification tap when app is in background (not terminated)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Handle notification tap when app was terminated
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }

    return token;
  }

  /// Show a local notification banner for foreground FCM messages.
  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: _encodePayload(message.data),
    );
  }

  /// Called when user taps on a local notification.
  void _onNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload != null && payload.isNotEmpty) {
      final data = _decodePayload(payload);
      onNotificationTap?.call(data);
    }
  }

  /// Called when user taps on an FCM notification (background/terminated).
  void _handleMessageOpenedApp(RemoteMessage message) {
    onNotificationTap?.call(message.data);
  }

  /// Store FCM token in SharedPreferences.
  Future<void> _storeFcmToken(String token) async {
    debugPrint('═══════════════════════════════════════════');
    debugPrint('FCM TOKEN (copied to clipboard):');
    debugPrint(token);
    debugPrint('═══════════════════════════════════════════');
    await Clipboard.setData(ClipboardData(text: token));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fcmTokenKey, token);
  }

  /// Retrieve stored FCM token.
  static Future<String?> getStoredFcmToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcmTokenKey);
  }

  /// Encode a data map as a simple key=value payload string.
  String _encodePayload(Map<String, dynamic> data) {
    return data.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  /// Decode a payload string back to a map.
  Map<String, dynamic> _decodePayload(String payload) {
    final map = <String, dynamic>{};
    for (final part in payload.split('&')) {
      final index = part.indexOf('=');
      if (index > 0) {
        map[part.substring(0, index)] = part.substring(index + 1);
      }
    }
    return map;
  }

  /// Store FCM token in SharedPreferences map against userId.
  static Future<void> storeTokenForUser(String userId, String token) async {
    final prefs = await SharedPreferences.getInstance();
    final map = await _getTokenMap();
    map[userId] = token;
    await prefs.setString(_fcmTokenMapKey, jsonEncode(map));
    debugPrint('FCM: Stored token for user $userId');
  }

  /// Retrieve stored FCM token for a specific user.
  static Future<String?> getTokenForUser(String userId) async {
    final map = await _getTokenMap();
    return map[userId];
  }

  /// Get the full token map from SharedPreferences.
  static Future<Map<String, String>> _getTokenMap() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_fcmTokenMapKey);
    if (raw == null) return {};
    return Map<String, String>.from(jsonDecode(raw) as Map);
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;

import '../notification_service.dart';
import 'face_auth_config.dart';

/// Trigger data for a re-verification event.
class ReVerificationTrigger {
  final DateTime scheduledTime;
  final int triggerIndex;

  const ReVerificationTrigger({
    required this.scheduledTime,
    required this.triggerIndex,
  });
}

/// Notification channel for re-verification alerts.
const _reVerifyChannelId = 'face_reverification_channel';
const _reVerifyChannelName = 'Scan your face to Proceed';
const _reVerifyChannelDesc = 'Scheduled face re-verification prompts';

/// Base notification ID for re-verification (offsets by trigger index).
const _reVerifyNotificationIdBase = 9000;

/// Payload prefix for re-verification notifications.
/// Must match NotificationService.reVerifyPayloadPrefix.
const _reVerifyPayloadPrefix = 'reverify:';

/// Generates random re-verification times per day within a configurable window.
/// Each verification window is separated by a configurable minimum gap.
/// Schedule is persisted in SharedPreferences and regenerated daily.
/// Also schedules OS-level local notifications so alerts fire even when the
/// app is closed or in the background.
class ReVerificationScheduler {
  static const String _scheduleKey = 'face_reverification_schedule';
  static const String _scheduleDateKey = 'face_reverification_schedule_date';
  static const String _completedKey = 'face_reverification_completed';

  final FaceAuthConfig config;
  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  final StreamController<ReVerificationTrigger> _triggerController =
      StreamController<ReVerificationTrigger>.broadcast();
  Timer? _timer;
  List<DateTime> _schedule = [];
  Set<int> _completedIndices = {};
  int _nextTriggerIndex = 0;

  /// Callback invoked when the user taps a re-verification notification.
  /// Set this from the hosting widget to trigger the in-app flow.
  void Function(int triggerIndex)? onNotificationTap;

  ReVerificationScheduler({
    this.config = const FaceAuthConfig(),
    FlutterLocalNotificationsPlugin? notificationsPlugin,
  }) : _notificationsPlugin =
            notificationsPlugin ?? NotificationService().flutterLocalNotificationsPlugin;

  /// Stream of re-verification triggers.
  Stream<ReVerificationTrigger> get triggers => _triggerController.stream;

  /// Initialize and start the scheduler.
  Future<void> start() async {
    try {
      await _initNotificationChannel();
    } catch (e) {
      debugPrint('ReVerificationScheduler: _initNotificationChannel failed: $e');
    }
    try {
      await _loadOrGenerateSchedule();
    } catch (e) {
      debugPrint('ReVerificationScheduler: _loadOrGenerateSchedule failed: $e');
    }
    // Always start monitoring even if notification setup fails
    _startMonitoring();
  }

  /// Create the Android notification channel for re-verification alerts.
  /// Does NOT call initialize() — that's done once by NotificationService
  /// to avoid overriding the shared tap handler.
  Future<void> _initNotificationChannel() async {
    tz_data.initializeTimeZones();

    // Register our tap handler with the shared NotificationService
    NotificationService().onReVerificationTap = _onReVerificationTapped;

    // Create Android channel (safe to call multiple times)
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          _reVerifyChannelId,
          _reVerifyChannelName,
          description: _reVerifyChannelDesc,
          importance: Importance.high,
          playSound: true,
          enableVibration: true,
        ));
  }

  /// Called by NotificationService when a re-verification notification is tapped.
  void _onReVerificationTapped(int triggerIndex) {
    debugPrint('ReVerificationScheduler: notification tapped, index=$triggerIndex');
    onNotificationTap?.call(triggerIndex);
    // Also fire through the stream so the in-app flow starts
    _triggerController.add(ReVerificationTrigger(
      scheduledTime: triggerIndex < _schedule.length
          ? _schedule[triggerIndex]
          : DateTime.now(),
      triggerIndex: triggerIndex,
    ));
  }

  /// Stop the scheduler.
  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Force regenerate schedule (e.g., on new day).
  Future<void> regenerate() async {
    await _generateNewSchedule();
    _nextTriggerIndex = 0;
    _completedIndices.clear();
    await _saveCompleted();
    _startMonitoring();
  }

  /// Mark a trigger as completed (verified, missed, or dismissed).
  Future<void> markCompleted(int triggerIndex) async {
    _completedIndices.add(triggerIndex);
    await _saveCompleted();
    // Cancel the OS notification for this trigger
    await _notificationsPlugin.cancel(_reVerifyNotificationIdBase + triggerIndex);
  }

  Future<void> _loadOrGenerateSchedule() async {
    // TODO: Restore persistence logic for production.
    // For testing, always generate a fresh schedule from now.
    await _generateNewSchedule();

    debugPrint('ReVerificationScheduler: schedule=$_schedule, '
        'completed=$_completedIndices, nextIndex=$_nextTriggerIndex');
    debugPrint('ReVerificationScheduler: now=${DateTime.now()}, '
        'scheduleCount=${_schedule.length}');
  }

  Future<void> _generateNewSchedule() async {
    final now = DateTime.now();
    final gapSeconds = config.minGapMinutes * 60; // convert to seconds for precision

    _schedule = [];
    _completedIndices.clear();

    // Generate triggers starting from (now + gap) with exact second precision.
    // First trigger comes in exactly minGapMinutes from now.
    for (int i = 0; i < config.promptCount; i++) {
      final triggerTime = now.add(Duration(seconds: gapSeconds * (i + 1)));
      // Don't schedule past the end-of-day window
      final dayEnd = DateTime(now.year, now.month, now.day, config.endHour);
      if (triggerTime.isAfter(dayEnd)) break;
      _schedule.add(triggerTime);
    }

    debugPrint('ReVerificationScheduler: generated schedule=$_schedule');

    // Persist
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _scheduleKey, _schedule.map((d) => d.toIso8601String()).toList());
    await prefs.setString(_scheduleDateKey, _dateString(now));
    await prefs.setStringList(_completedKey, []);

    // Schedule OS-level notifications for each trigger
    try {
      await _scheduleNotifications();
    } catch (e) {
      debugPrint('ReVerificationScheduler: _scheduleNotifications failed: $e');
    }
  }

  /// Cancel existing and schedule new local notifications for each trigger.
  /// Only schedules the next [_maxOsNotifications] to avoid slow startup.
  static const int _maxOsNotifications = 5;

  Future<void> _scheduleNotifications() async {
    // Cancel previous re-verification notifications (only up to what we schedule)
    for (int i = 0; i < _maxOsNotifications; i++) {
      await _notificationsPlugin.cancel(_reVerifyNotificationIdBase + i);
    }

    final now = DateTime.now();
    final local = tz.local;
    int scheduled = 0;

    for (int i = 0; i < _schedule.length; i++) {
      if (scheduled >= _maxOsNotifications) break;
      final dt = _schedule[i];
      if (dt.isBefore(now)) continue; // skip past times

      final scheduledTz = tz.TZDateTime(
        local,
        dt.year,
        dt.month,
        dt.day,
        dt.hour,
        dt.minute,
        dt.second,
      );

      try {
        await _notificationsPlugin.zonedSchedule(
          _reVerifyNotificationIdBase + i,
          'Face Verification Required',
          'Tap to verify your identity now. You have ${config.countdownDuration.inMinutes} minutes.',
          scheduledTz,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              _reVerifyChannelId,
              _reVerifyChannelName,
              channelDescription: _reVerifyChannelDesc,
              importance: Importance.high,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
              fullScreenIntent: true,
              category: AndroidNotificationCategory.alarm,
              visibility: NotificationVisibility.public,
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              interruptionLevel: InterruptionLevel.timeSensitive,
            ),
          ),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          payload: '$_reVerifyPayloadPrefix$i',
        );
        scheduled++;
        debugPrint(
            'ReVerificationScheduler: scheduled notification #$i at $scheduledTz');
      } catch (e) {
        debugPrint(
            'ReVerificationScheduler: failed to schedule notification #$i: $e');
      }
    }
  }

  Future<void> _saveCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _completedKey, _completedIndices.map((i) => i.toString()).toList());
  }

  void _startMonitoring() {
    _timer?.cancel();
    // TODO: Restore to 30 seconds for production
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      _checkTriggers();
    });
    debugPrint('ReVerificationScheduler: monitoring started, polling every 10s');
  }

  void _checkTriggers() {
    if (_nextTriggerIndex >= _schedule.length) {
      debugPrint('ReVerificationScheduler: _checkTriggers — all triggers done ($_nextTriggerIndex >= ${_schedule.length})');
      return;
    }

    final now = DateTime.now();

    // Check for day boundary — regenerate if schedule is stale
    if (_schedule.isNotEmpty && _schedule.first.day != now.day) {
      regenerate();
      return;
    }

    final nextTime = _schedule[_nextTriggerIndex];

    // Skip completed triggers
    if (_completedIndices.contains(_nextTriggerIndex)) {
      _nextTriggerIndex++;
      return;
    }

    final diff = nextTime.difference(now);
    debugPrint('ReVerificationScheduler: _checkTriggers — now=$now, next=#$_nextTriggerIndex at $nextTime (in ${diff.inSeconds}s)');

    if (now.isAfter(nextTime)) {
      debugPrint('ReVerificationScheduler: >>> FIRING trigger $_nextTriggerIndex');
      _triggerController.add(ReVerificationTrigger(
        scheduledTime: nextTime,
        triggerIndex: _nextTriggerIndex,
      ));
      _nextTriggerIndex++;
    }
  }

  String _dateString(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// The current schedule for today (for debugging/UI).
  List<DateTime> get currentSchedule => List.unmodifiable(_schedule);

  /// Number of completed verifications today.
  int get completedCount => _completedIndices.length;

  /// Total verifications scheduled today.
  int get totalCount => _schedule.length;

  void dispose() {
    stop();
    _triggerController.close();
  }
}

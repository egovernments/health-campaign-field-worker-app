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

/// Fixed notification ID used for every re-verification notification.
/// Using a single ID ensures a new notification always replaces the old one
/// in the tray — no stacking regardless of how many triggers have fired.
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
  // Countdown minutes persisted alongside the schedule so the background
  // watchdog (which runs in a separate isolate with no BLoC / MDMS access)
  // can surface the same "You have N minutes" copy as the foreground scheduler.
  static const String _countdownMinutesKey =
      'face_reverification_countdown_minutes';
  // Trigger index that was dispatched but dropped by a guard
  // (no enrollment / no active register / wrong route). The in-app scheduler
  // re-emits it from _checkTriggers so the popup appears once guards pass
  // (e.g. after the user picks boundary and registers sync).
  static const String _pendingTriggerKey =
      'face_reverification_pending_trigger';

  final FaceAuthConfig config;
  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  final StreamController<ReVerificationTrigger> _triggerController =
      StreamController<ReVerificationTrigger>.broadcast();
  Timer? _timer;
  List<DateTime> _schedule = [];
  Set<int> _completedIndices = {};
  int _nextTriggerIndex = 0;
  DateTime? _scheduleDate; // date the current schedule was generated for

  /// Callback invoked when the user taps a re-verification notification.
  /// Set this from the hosting widget to trigger the in-app flow.
  void Function(int triggerIndex)? onNotificationTap;

  /// Returns true when the app is in the foreground (resumed).
  /// Set by the hosting widget. Defaults to always-true so unit tests
  /// and non-widget callers work without wiring it up.
  /// Used by _checkTriggers to skip in-app dispatch while backgrounded —
  /// OS notifications handle alerting when the screen is off.
  bool Function() isForeground = () => true;

  ReVerificationScheduler({
    this.config = const FaceAuthConfig(),
    FlutterLocalNotificationsPlugin? notificationsPlugin,
  }) : _notificationsPlugin =
            notificationsPlugin ?? NotificationService().flutterLocalNotificationsPlugin;

  /// Stream of re-verification triggers.
  Stream<ReVerificationTrigger> get triggers => _triggerController.stream;

  /// Initialize and start the scheduler.
  ///
  /// Set [immediateFirstTrigger] to true after a config-change restart so the
  /// first prompt fires in 1 minute instead of the full gap. This ensures the
  /// user gets an OS notification promptly after a scheduler reset.
  Future<void> start({bool immediateFirstTrigger = false}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool('face_reverify_skip') == true) {
        debugPrint('ReVerificationScheduler: supervisor flag set — not scheduling');
        return;
      }
    } catch (e) {
      debugPrint('ReVerificationScheduler: supervisor flag read failed: $e');
    }
    try {
      await _initNotificationChannel();
    } catch (e) {
      debugPrint('ReVerificationScheduler: _initNotificationChannel failed: $e');
    }
    try {
      await _loadOrGenerateSchedule(immediateFirstTrigger: immediateFirstTrigger);
    } catch (e) {
      debugPrint('ReVerificationScheduler: _loadOrGenerateSchedule failed: $e');
    }
    // Always start monitoring even if notification setup fails
    _startMonitoring();
    // Drain a notification tap that arrived before the in-app callback
    // was wired up. This covers the cold-start race where the user taps
    // the OS notification while the main isolate is still initializing.
    try {
      await _drainPendingTap();
    } catch (e) {
      debugPrint('ReVerificationScheduler: _drainPendingTap failed: $e');
    }
  }

  /// Reads [reVerifyPendingTapKey] (written by NotificationService when a tap
  /// arrives before the callback is set) and re-emits the trigger so the
  /// hosting page can run guards / dispatch the popup. Idempotent; safe to
  /// call multiple times.
  Future<void> _drainPendingTap() async {
    final prefs = await SharedPreferences.getInstance();
    final pendingIdx = prefs.getInt(reVerifyPendingTapKey);
    if (pendingIdx == null) return;
    await prefs.remove(reVerifyPendingTapKey);
    debugPrint(
        'ReVerificationScheduler: draining pending tap #$pendingIdx from cold-start race');
    // Route through the same handler the live callback uses so notification
    // cancel + stream emit + nextIndex bookkeeping all behave the same.
    _onReVerificationTapped(pendingIdx);
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
    // Clear the notification immediately so the tray is clean.
    _notificationsPlugin.cancel(_reVerifyNotificationIdBase);
    onNotificationTap?.call(triggerIndex);
    // Skip if the scheduler already fired this index in-app.
    if (triggerIndex < _nextTriggerIndex) {
      debugPrint(
          'ReVerificationScheduler: skipping tap for index=$triggerIndex (already fired by scheduler, nextIndex=$_nextTriggerIndex)');
      _scheduleNextNotification();
      return;
    }
    _triggerController.add(ReVerificationTrigger(
      scheduledTime: triggerIndex < _schedule.length
          ? _schedule[triggerIndex]
          : DateTime.now(),
      triggerIndex: triggerIndex,
    ));
    if (triggerIndex >= _nextTriggerIndex) {
      _nextTriggerIndex = triggerIndex + 1;
    }
    // Schedule the next notification now that this one has been handled.
    _scheduleNextNotification();
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
    // Cancel current notification then schedule the next pending one.
    await _scheduleNextNotification();
  }

  Future<void> _loadOrGenerateSchedule({bool immediateFirstTrigger = false}) async {
    // When a config-change restart is requested, always generate a fresh schedule
    // so the new timing parameters take effect immediately.
    if (!immediateFirstTrigger) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final savedDate = prefs.getString(_scheduleDateKey);
        final now = DateTime.now();
        final todayStr = _dateString(now);

        if (savedDate == todayStr) {
          final rawSchedule = prefs.getStringList(_scheduleKey) ?? [];
          if (rawSchedule.isNotEmpty) {
            _schedule = rawSchedule
                .map((s) => DateTime.tryParse(s))
                .whereType<DateTime>()
                .toList();
            _scheduleDate = now;

            final savedCompleted = prefs.getStringList(_completedKey) ?? [];
            _completedIndices = savedCompleted
                .map((s) => int.tryParse(s))
                .whereType<int>()
                .toSet();

            // Resume from the next pending trigger (skip already-completed ones).
            _nextTriggerIndex = 0;
            for (int i = 0; i < _schedule.length; i++) {
              if (_completedIndices.contains(i)) {
                _nextTriggerIndex = i + 1;
              }
            }

            debugPrint(
              'ReVerificationScheduler: loaded persisted schedule=$_schedule, '
              'completed=$_completedIndices, nextIndex=$_nextTriggerIndex',
            );

            // If every persisted trigger has already been completed (or
            // the schedule is empty), there is nothing left to fire today
            // from the cached entry. Fall through to _generateNewSchedule
            // so a fresh schedule is built from the current MDMS config.
            final hasPendingFutureTrigger = _schedule
                .asMap()
                .entries
                .any((e) =>
                    !_completedIndices.contains(e.key) &&
                    e.value.isAfter(now));
            if (!hasPendingFutureTrigger) {
              debugPrint(
                'ReVerificationScheduler: persisted schedule fully consumed '
                '— regenerating fresh schedule',
              );
            } else {
              try {
                await _scheduleNotifications();
              } catch (e) {
                debugPrint(
                    'ReVerificationScheduler: _scheduleNotifications failed: $e');
              }
              return;
            }
          }
        }
      } catch (e) {
        debugPrint('ReVerificationScheduler: failed to load persisted schedule: $e');
      }
    }

    await _generateNewSchedule(immediateFirstTrigger: immediateFirstTrigger);

    debugPrint('ReVerificationScheduler: schedule=$_schedule, '
        'completed=$_completedIndices, nextIndex=$_nextTriggerIndex');
    debugPrint('ReVerificationScheduler: now=${DateTime.now()}, '
        'scheduleCount=${_schedule.length}');
  }

  Future<void> _generateNewSchedule({bool immediateFirstTrigger = false}) async {
    final now = DateTime.now();
    final gapSeconds = config.minGapMinutes * 60; // convert to seconds for precision

    _schedule = [];
    _completedIndices.clear();
    _scheduleDate = now;

    final dayEnd = DateTime(now.year, now.month, now.day, config.endHour);
    final dayStart = DateTime(now.year, now.month, now.day, config.startHour);

    // When immediateFirstTrigger is true (post-config-reset), fire the first
    // prompt in 1 minute so the user gets an OS notification quickly after the
    // scheduler restart. Subsequent triggers use the normal gap cadence.
    for (int i = 0; i < config.promptCount; i++) {
      final delaySeconds = (i == 0 && immediateFirstTrigger) ? 60 : gapSeconds * (i + 1);
      final triggerTime = now.add(Duration(seconds: delaySeconds));
      if (triggerTime.isAfter(dayEnd)) break;
      _schedule.add(triggerTime);
    }

    // If the full gap doesn't fit before endHour but we're still inside the
    // work window, add one trigger 1 minute out so the user gets at least
    // one re-verification today.
    if (_schedule.isEmpty && now.isAfter(dayStart) && now.isBefore(dayEnd)) {
      final fallback = now.add(const Duration(minutes: 1));
      _schedule.add(fallback);
      debugPrint('ReVerificationScheduler: added fallback trigger at $fallback (within window, gap too large)');
    }

    debugPrint('ReVerificationScheduler: generated schedule=$_schedule');
    for (var i = 0; i < _schedule.length; i++) {
      final t = _schedule[i];
      final diff = t.difference(now);
      final hh = t.hour.toString().padLeft(2, '0');
      final mm = t.minute.toString().padLeft(2, '0');
      final ss = t.second.toString().padLeft(2, '0');
      debugPrint(
        'ReVerificationScheduler: prompt #$i at $hh:$mm:$ss '
        '(in ${diff.inMinutes}m ${diff.inSeconds % 60}s from now)',
      );
    }
    debugPrint(
      'ReVerificationScheduler: config '
      'startHour=${config.startHour} endHour=${config.endHour} '
      'promptCount=${config.promptCount} minGapMinutes=${config.minGapMinutes} '
      'countdownMin=${config.countdownDuration.inMinutes}',
    );

    // Persist
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _scheduleKey, _schedule.map((d) => d.toIso8601String()).toList());
    await prefs.setString(_scheduleDateKey, _dateString(now));
    await prefs.setStringList(_completedKey, []);
    // Clear background-service notified set so the new schedule starts fresh
    await prefs.setStringList('face_reverification_bg_notified', []);
    await prefs.setInt(
        _countdownMinutesKey, config.countdownDuration.inMinutes);

    // Schedule OS-level notifications for each trigger
    try {
      await _scheduleNotifications();
    } catch (e) {
      debugPrint('ReVerificationScheduler: _scheduleNotifications failed: $e');
    }
  }

  /// Cancel all known re-verification notifications and schedule only the next
  /// pending trigger. Using a single fixed ID ensures no stacking in the tray.
  Future<void> _scheduleNotifications() async {
    // Cancel the fixed-ID notification plus any legacy per-index ones (migration).
    await _notificationsPlugin.cancel(_reVerifyNotificationIdBase);
    for (int i = 1; i <= 5; i++) {
      await _notificationsPlugin.cancel(_reVerifyNotificationIdBase + i);
    }
    await _scheduleNextNotification();
  }

  /// Schedules only the next unfired trigger using the fixed notification ID.
  /// Cancels any existing notification first so there is always at most one
  /// re-verification notification visible in the system tray.
  Future<void> _scheduleNextNotification() async {
    await _notificationsPlugin.cancel(_reVerifyNotificationIdBase);

    // Find the next pending (not completed) trigger that hasn't fired yet.
    int? nextIdx;
    final now = DateTime.now();
    for (int i = 0; i < _schedule.length; i++) {
      if (_completedIndices.contains(i)) continue;
      if (_schedule[i].isBefore(now)) continue;
      nextIdx = i;
      break;
    }
    if (nextIdx == null) return;

    final dt = _schedule[nextIdx];
    final scheduleMode = await _getAndroidScheduleMode();
    // Use TZDateTime.from() so the epoch milliseconds from the local DateTime
    // are preserved exactly — avoids scheduling 1–N hours late in non-UTC zones.
    final scheduledTz = tz.TZDateTime.from(dt, tz.UTC);
    try {
      await _notificationsPlugin.zonedSchedule(
        _reVerifyNotificationIdBase,
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
        androidScheduleMode: scheduleMode,
        payload: '$_reVerifyPayloadPrefix$nextIdx',
      );
      debugPrint(
          'ReVerificationScheduler: scheduled next notification #$nextIdx at $scheduledTz (mode=$scheduleMode)');
    } catch (e) {
      debugPrint(
          'ReVerificationScheduler: failed to schedule notification #$nextIdx: $e');
    }
  }

  /// Returns the appropriate Android schedule mode based on permissions.
  Future<AndroidScheduleMode> _getAndroidScheduleMode() async {
    try {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        final canExact = await androidPlugin.canScheduleExactNotifications();
        if (canExact == false) {
          debugPrint(
              'ReVerificationScheduler: exact alarms not permitted — using alarmClock mode');
          return AndroidScheduleMode.alarmClock;
        }
      }
    } catch (e) {
      debugPrint(
          'ReVerificationScheduler: canScheduleExactNotifications check failed: $e');
    }
    return AndroidScheduleMode.exactAllowWhileIdle;
  }

  Future<void> _saveCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _completedKey, _completedIndices.map((i) => i.toString()).toList());
  }

  void _startMonitoring() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      _checkTriggers();
    });
    debugPrint('ReVerificationScheduler: monitoring started, polling every 30s');
  }

  void _checkTriggers() {
    final now = DateTime.now();

    // Day boundary check always runs regardless of foreground state so the
    // OS notification schedule is refreshed even when the screen is off.
    if (_scheduleDate != null && _scheduleDate!.day != now.day) {
      debugPrint('ReVerificationScheduler: new day detected, regenerating schedule');
      regenerate();
      return;
    }

    // Don't fire in-app triggers while the app is backgrounded.
    // The OS notifications (already scheduled) handle alerting. Firing the
    // in-app trigger in background would cycle the bloc through all iterations
    // silently, so when the user taps the OS notification _nextTriggerIndex has
    // already advanced and the tap is dropped — leaving nothing on screen.
    if (!isForeground()) {
      debugPrint('ReVerificationScheduler: app in background — skipping in-app trigger check');
      return;
    }

    if (_nextTriggerIndex >= _schedule.length) {
      return;
    }

    if (_completedIndices.contains(_nextTriggerIndex)) {
      _nextTriggerIndex++;
      return;
    }

    final nextTime = _schedule[_nextTriggerIndex];
    final diff = nextTime.difference(now);
    debugPrint('ReVerificationScheduler: _checkTriggers — now=$now, next=#$_nextTriggerIndex at $nextTime (in ${diff.inSeconds}s)');

    if (now.isAfter(nextTime)) {
      debugPrint('ReVerificationScheduler: >>> FIRING trigger $_nextTriggerIndex');
      // Cancel the OS notification — handling in-app, no tray entry needed.
      _notificationsPlugin.cancel(_reVerifyNotificationIdBase);
      _triggerController.add(ReVerificationTrigger(
        scheduledTime: nextTime,
        triggerIndex: _nextTriggerIndex,
      ));
      _nextTriggerIndex++;
    }

    // Replay any trigger that was dropped by a guard earlier (e.g. the user
    // tapped the notification on the boundary-selection screen where no
    // register was yet loaded). Re-emit the trigger every tick until the
    // hosting page either dispatches it (clearPending) or its window expires.
    _replayPendingIfAny(now);
  }

  /// Reads the pending-trigger key and re-emits the trigger onto the stream
  /// if it's still within a reasonable window. Idempotent — calling repeatedly
  /// is fine; _dispatchTrigger's clearPending stops the loop on success.
  Future<void> _replayPendingIfAny(DateTime now) async {
    if (!isForeground()) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingIdx = prefs.getInt(_pendingTriggerKey);
      if (pendingIdx == null) return;
      if (pendingIdx < 0 || pendingIdx >= _schedule.length) {
        await prefs.remove(_pendingTriggerKey);
        return;
      }
      if (_completedIndices.contains(pendingIdx)) {
        await prefs.remove(_pendingTriggerKey);
        return;
      }
      final triggerTime = _schedule[pendingIdx];
      // Expire if more than 2x countdownDuration past the trigger time —
      // beyond that, the trigger is stale and should not keep nagging.
      final age = now.difference(triggerTime);
      if (age > config.countdownDuration * 2) {
        await prefs.remove(_pendingTriggerKey);
        return;
      }
      debugPrint(
          'ReVerificationScheduler: replaying pending trigger #$pendingIdx');
      _triggerController.add(ReVerificationTrigger(
        scheduledTime: triggerTime,
        triggerIndex: pendingIdx,
      ));
    } catch (e) {
      debugPrint('ReVerificationScheduler: _replayPendingIfAny failed: $e');
    }
  }

  String _dateString(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Immediately checks for past-due triggers. Call when the app returns to
  /// foreground so the in-app prompt fires without waiting for the next tick.
  void checkNow() => _checkTriggers();

  /// Persist a trigger that was dispatched but dropped by a guard.
  /// The next foreground _checkTriggers tick will re-emit it so the popup
  /// fires once the guard condition flips (registers loaded, etc).
  Future<void> markPending(int triggerIndex) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_pendingTriggerKey, triggerIndex);
      debugPrint(
          'ReVerificationScheduler: markPending #$triggerIndex (will replay every 30s)');
    } catch (e) {
      debugPrint('ReVerificationScheduler: markPending failed: $e');
    }
  }

  /// Clear the pending trigger once it has been successfully dispatched.
  Future<void> clearPending() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final had = prefs.getInt(_pendingTriggerKey);
      await prefs.remove(_pendingTriggerKey);
      if (had != null) {
        debugPrint(
            'ReVerificationScheduler: clearPending — removed pending #$had');
      }
    } catch (e) {
      debugPrint('ReVerificationScheduler: clearPending failed: $e');
    }
  }

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

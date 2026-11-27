import 'package:flutter/foundation.dart';
// The only file in the package (and the app) that imports the PostHog SDK.
// To use another tool, add a provider like this one; nothing else changes.
import 'package:posthog_flutter/posthog_flutter.dart';

import '../telemetry_provider.dart';

/// [TelemetryProvider] for PostHog.
///
/// The host app must turn off PostHog's automatic start, so nothing is sent
/// before [start]:
/// - Android `AndroidManifest.xml`: `<meta-data
///   android:name="com.posthog.posthog.AUTO_INIT" android:value="false" />`
/// - iOS `Info.plist`: `com.posthog.posthog.AUTO_INIT` = `false`
///
/// `posthog_flutter` 5.0.0 pulls `posthog-android:3.+`; apps on Kotlin 1.8
/// must pin `com.posthog:posthog-android` to 3.14.1 in `android/build.gradle`.
class PosthogProvider implements TelemetryProvider {
  PosthogProvider({required String host, required String apiKey})
      : _host = host.trim(),
        _apiKey = apiKey.trim();

  final String _host;
  final String _apiKey;
  bool _setUp = false;

  @override
  String get name => 'posthog';

  @override
  bool get isConfigured => _host.isNotEmpty && _apiKey.isNotEmpty;

  @override
  Future<void> start() async {
    if (_setUp) {
      await Posthog().enable();
      return;
    }
    final config = PostHogConfig(_apiKey)
      ..host = _host
      ..debug = kDebugMode
      ..captureApplicationLifecycleEvents = true
      // Users are identified after login; events before that must not create
      // person profiles.
      ..personProfiles = PostHogPersonProfiles.identifiedOnly
      ..sessionReplay = false;
    await Posthog().setup(config);
    _setUp = true;
  }

  @override
  Future<void> stop() => Posthog().disable();

  @override
  Future<void> identify(String userId, TelemetryProperties? properties) =>
      Posthog().identify(userId: userId, userProperties: properties);

  @override
  Future<void> reset() => Posthog().reset();

  @override
  Future<void> screen(String name, TelemetryProperties? properties) =>
      Posthog().screen(screenName: name, properties: properties);

  @override
  Future<void> capture(String event, TelemetryProperties? properties) =>
      Posthog().capture(eventName: event, properties: properties);

  @override
  Future<void> register(TelemetryProperties properties) async {
    for (final entry in properties.entries) {
      await Posthog().register(entry.key, entry.value);
    }
  }
}

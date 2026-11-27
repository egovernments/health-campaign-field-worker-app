/// Product telemetry for DIGIT apps behind one provider-independent API.
///
/// Setup, once at app start:
/// ```dart
/// DigitTelemetry.initialize(PosthogProvider(host: host, apiKey: key));
/// NavigationTracker.instance.policy = TrackingPolicy.fromJson(policyJson);
/// await DigitTelemetry.instance.start();
/// ```
/// Then log through [DigitTelemetry.instance] only. To change the telemetry
/// tool, implement [TelemetryProvider] and pass it to
/// [DigitTelemetry.initialize]; no other code changes.
library digit_telemetry_service;

export 'src/telemetry_provider.dart';
export 'src/digit_telemetry.dart';
export 'src/navigation_tracker.dart';
export 'src/providers/posthog_provider.dart';
export 'src/tracking_policy.dart';
